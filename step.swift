#!/usr/bin/env swift

import Foundation

let filePath = ProcessInfo.processInfo.environment["file_path"] ?? ""
let appSlug = ProcessInfo.processInfo.environment["app_slug"] ?? ""
let buildSlug = ProcessInfo.processInfo.environment["build_slug"] ?? ""
let wasabiAccessKey = ProcessInfo.processInfo.environment["aws_access_key"] ?? ""
let wasabiSecretKey = ProcessInfo.processInfo.environment["aws_secret_key"] ?? ""
let bucketName = ProcessInfo.processInfo.environment["bucket_name"] ?? ""
let bucketRegion = ProcessInfo.processInfo.environment["bucket_region"] ?? ""
let pathInBucket = ProcessInfo.processInfo.environment["path_in_bucket"] ?? ""
let fileAccessLevel = ProcessInfo.processInfo.environment["file_access_level"] ?? ""

// Print options
print("Configs:")
print("* file_path: \(filePath)")
print("* app_slug: \(appSlug)")
print("* build_slug: \(buildSlug)")
print("* aws_access_key: \(wasabiAccessKey.isEmpty ? "" : "***")")
print("* aws_secret_key: \(wasabiSecretKey.isEmpty ? "" : "***")")
print("* bucket_name: \(bucketName)")
print("* bucket_region: \(bucketRegion)")
print("* path_in_bucket: \(pathInBucket)")
print("* file_access_level: \(fileAccessLevel)")
