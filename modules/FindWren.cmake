include(FindPackageHandleStandardArgs)

if(NOT TARGET Wren)
  # find_path(WREN_INCLUDE_DIR NAMES wren.hpp PATHS ${CMAKE_CURRENT_LIST_DIR}/../libs/wren/src/include)
  set(WREN_INCLUDE_DIR $(CMAKE_CURRENT_LIST_DIR)/../libs/wren/src/include)
  set(WREN_VM_DIR $(CMAKE_CURRENT_LIST_DIR)/../libs/wren/src/vm)
  set(WREN_OPTIONAL_DIR $(CMAKE_CURRENT_LIST_DIR)/../libs/wren/src/optional)
  mark_as_advanced(FORCE WREN_INCLUDE_DIR)

  file(GLOB_RECURSE WREN_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/libs/wren/src/vm/*.c;${CMAKE_CURRENT_SOURCE_DIR}/libs/wren/src/optional/*.c)
  add_library(Wren STATIC ${WREN_SOURCES}) 
  target_compile_definitions(Wren PRIVATE WREN_OPT_META=0 WREN_OPT_RANDOM=1)
  target_include_directories(Wren PUBLIC ${WREN_INCLUDE_DIR};${WREN_VM_DIR};${WREN_OPTIONAL_DIR})
  set_target_properties(Wren PROPERTIES INTERFACE_INCLUDE_DIRECTORIES ${WREN_INCLUDE_DIR})
endif()

find_package_handle_standard_args(Wren DEFAULT_MSG WREN_INCLUDE_DIR)
