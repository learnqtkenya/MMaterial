function(append_files_to_variable base_path variable_name)
    # Ensure the base path is provided
    if(NOT base_path)
        message(FATAL_ERROR "Base path must be provided")
    endif()

    # Ensure the variable name is provided
    if(NOT variable_name)
        message(FATAL_ERROR "Variable name must be provided")
    endif()

    # Get the absolute path
    get_filename_component(abs_base_path "${base_path}" ABSOLUTE)

    # Check if the directory exists
    if(NOT IS_DIRECTORY "${abs_base_path}")
        message(WARNING "The specified path '${abs_base_path}' is not a directory")
        return()
    endif()

    # Get the file extensions from the additional arguments
    set(file_extensions ${ARGN})
    if(NOT file_extensions)
        message(WARNING "No file extensions specified. No files will be added.")
        return()
    endif()

    # Find all specified files recursively
    set(all_files "")
    foreach(ext ${file_extensions})
        file(GLOB_RECURSE found_files
            LIST_DIRECTORIES false
            RELATIVE "${abs_base_path}"
            "${abs_base_path}/*.${ext}"
        )
        list(APPEND all_files ${found_files})
    endforeach()

    # Append the files to the variable
    foreach(file ${all_files})
        list(APPEND ${variable_name} "${base_path}/${file}")
    endforeach()

    # Set the variable in the parent scope
    set(${variable_name} ${${variable_name}} PARENT_SCOPE)
endfunction()