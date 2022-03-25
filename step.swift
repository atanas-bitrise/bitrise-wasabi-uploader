import Foundation

let filePath = ProcessInfo.processInfo.environment["file_path"] ?? ""
let appSlug = ProcessInfo.processInfo.environment["app_slug"] ?? ""
let buildSlug = ProcessInfo.processInfo.environment["build_slug"] ?? ""
let wasabiAccessKey = ProcessInfo.processInfo.environment["wasabi_access_key"] ?? ""
let wasabiSecretKey = ProcessInfo.processInfo.environment["wasabi_secret_key"] ?? ""
let bucketName = ProcessInfo.processInfo.environment["bucket_name"] ?? ""
let bucketRegion = ProcessInfo.processInfo.environment["bucket_region"] ?? ""
let pathInBucket = ProcessInfo.processInfo.environment["path_in_bucket"] ?? ""
let fileAccessLevel = ProcessInfo.processInfo.environment["file_access_level"] ?? ""

func validateNotEmpty(variable: String, name: String) {
    if variable.isEmpty {
        print("Missing required input: \(name).")
        exit(1)
    }
}

func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

// Print options
print("Configs:")
print("* file_path: \(filePath)")
print("* app_slug: \(appSlug)")
print("* build_slug: \(buildSlug)")
print("* wasabi_access_key: \(wasabiAccessKey.isEmpty ? "" : "***")")
print("* wasabi_secret_key: \(wasabiSecretKey.isEmpty ? "" : "***")")
print("* bucket_name: \(bucketName)")
print("* bucket_region: \(bucketRegion)")
print("* path_in_bucket: \(pathInBucket)")
print("* file_access_level: \(fileAccessLevel)")


// Validation
print("\nValidating...")

validateNotEmpty(variable: filePath, name: "file_path")
validateNotEmpty(variable: appSlug, name: "app_slug")
validateNotEmpty(variable: buildSlug, name: "build_slug")
validateNotEmpty(variable: wasabiAccessKey, name: "wasabi_access_key")
validateNotEmpty(variable: wasabiSecretKey, name: "wasabi_secret_key")
validateNotEmpty(variable: bucketName, name: "bucket_name")
validateNotEmpty(variable: bucketRegion, name: "bucket_region")
validateNotEmpty(variable: pathInBucket, name: "path_in_bucket")
validateNotEmpty(variable: fileAccessLevel, name: "file_access_level")

if !FileManager.default.fileExists(atPath: filePath) {
    print("No file found to upload. Terminating.")
    exit(1)
}

print("Validation successful.")

// Set up access environment variables
setenv("AWS_ACCESS_KEY_ID", wasabiAccessKey, 1)
setenv("AWS_SECRET_ACCESS_KEY", wasabiSecretKey, 1)
setenv("AWS_DEFAULT_REGION", bucketRegion, 1)

// Call Wasabi API
let outcome = shell("aws", "s3", "cp", "\(filePath)", "s3://\(bucketName)/\(pathInBucket)", "--acl", "\(fileAccessLevel)", "--endpoint-url=https://s3.\(bucketRegion).wasabisys.com")

// Output
print("File upload was \((outcome == 0) ? "successful" : "unsuccessful").")

exit(outcome)
