# Copyright 2017 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
include (ExternalProject)

set(cub_URL https://mirror.bazel.build/github.com/NVlabs/cub/archive/1.7.4.zip)
set(cub_HASH SHA256=20a1a39fd97e5da7f40f5f2e7fd73fd2ea59f9dc4bb8a6c5f228aa543e727e31)
set(cub_BUILD ${CMAKE_CURRENT_BINARY_DIR}/cub/src/cub)
set(cub_INCLUDE_DIR ${CMAKE_CURRENT_BINARY_DIR}/cub/src/cub)
set(cub_ARCHIVE_DIR ${CMAKE_CURRENT_BINARY_DIR}/external/cub_archive)

ExternalProject_Add(cub
    PREFIX cub
    URL ${cub_URL}
    URL_HASH ${cub_HASH}
    DOWNLOAD_DIR "${DOWNLOAD_LOCATION}"
    BUILD_IN_SOURCE 1
    PATCH_COMMAND ${CMAKE_COMMAND} -E copy_if_different ${CMAKE_CURRENT_SOURCE_DIR}/patches/cub/CMakeLists.txt ${cub_BUILD}
    INSTALL_COMMAND  ${CMAKE_COMMAND} -E copy_directory  ${cub_INCLUDE_DIR}/cub ${cub_ARCHIVE_DIR}/cub
    CMAKE_CACHE_ARGS
      -DCMAKE_BUILD_TYPE:STRING=Release
      -DCMAKE_C_FLAGS_DEBUG:STRING=${FLAGS_DEBUG}
      -DCMAKE_C_FLAGS_MINSIZEREL:STRING=${FLAGS_MINSIZEREL}
      -DCMAKE_C_FLAGS_RELEASE:STRING=${FLAGS_RELEASE}
      -DCMAKE_C_FLAGS_RELWITHDEBINFO:STRING=${FLAGS_RELWITHDEBINFO}
      -DCMAKE_CXX_FLAGS_DEBUG:STRING=${FLAGS_DEBUG}
      -DCMAKE_CXX_FLAGS_MINSIZEREL:STRING=${FLAGS_MINSIZEREL}
      -DCMAKE_CXX_FLAGS_RELEASE:STRING=${FLAGS_RELEASE}
      -DCMAKE_CXX_FLAGS_RELWITHDEBINFO:STRING=${FLAGS_RELWITHDEBINFO}
)
