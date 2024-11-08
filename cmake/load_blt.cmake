if (NOT BLT_LOADED)
  if (DEFINED BLT_SOURCE_DIR)
    if (NOT EXISTS ${BLT_SOURCE_DIR}/SetupBLT.cmake)
      message(FATAL_ERROR "Given BLT_SOURCE_DIR does not contain SetupBLT.cmake")
    endif()
  else ()
    set (BLT_SOURCE_DIR ${PROJECT_SOURCE_DIR}/extern/blt CACHE PATH "")

    if (NOT EXISTS ${BLT_SOURCE_DIR}/SetupBLT.cmake)
      message(FATAL_ERROR "\
      The BLT submodule is not present. \
      If in git repository run the following two commands:\n \
      git submodule init\n \
      git submodule update")
    endif ()
  endif ()
  include(${BLT_SOURCE_DIR}/SetupBLT.cmake)
endif()
  
include(${BLT_SOURCE_DIR}/cmake/BLTMacros.cmake)
if (NOT EXISTS ${BLT_SOURCE_DIR}/cmake/BLTMacros.cmake)
    message(FATAL_ERROR "COULDNT FIND BLT MACROS")
else()
    file(READ ${BLT_SOURCE_DIR}/cmake/BLTMacros.cmake file_contents)
    message(STATUS "KEYWORD ${BLT_SOURCE_DIR}")
    message(STATUS "heres all the macros ${file_contents}")
endif()
blt_install_tpl_setups(DESTINATION lib/cmake/camp)
