#!/usr/bin/env swift

import Foundation

// Print options
print("Configs:")
print("* file_path: \(ProcessInfo.processInfo.environment["file_path"] ?? "")")
print("* app_slug: \(ProcessInfo.processInfo.environment["app_slug"] ?? "")")
print("* build_slug: \(ProcessInfo.processInfo.environment["build_slug"] ?? "")")
print("* aws_access_key: \((ProcessInfo.processInfo.environment["aws_access_key"] != nil) ? "***" : "")")
print("* aws_secret_key: \((ProcessInfo.processInfo.environment["aws_secret_key"] != nil) ? "***" : "")")
print("* bucket_name: \(ProcessInfo.processInfo.environment["bucket_name"] ?? "")")
print("* bucket_region: \(ProcessInfo.processInfo.environment["bucket_region"] ?? "")")
print("* path_in_bucket: \(ProcessInfo.processInfo.environment["path_in_bucket"] ?? "")")
print("* file_access_level: \(ProcessInfo.processInfo.environment["file_access_level"] ?? "")")
