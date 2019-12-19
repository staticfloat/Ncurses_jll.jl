# Autogenerated wrapper script for Ncurses_jll for i686-w64-mingw32
export libmenu, libncurses, libpanel, libform

using Gettext_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libmenu`
const libmenu_splitpath = ["bin", "libmenu6.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmenu_path = ""

# libmenu-specific global declaration
# This will be filled out by __init__()
libmenu_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmenu = "libmenu6.dll"


# Relative path to `libncurses`
const libncurses_splitpath = ["bin", "libncurses6.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libncurses_path = ""

# libncurses-specific global declaration
# This will be filled out by __init__()
libncurses_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libncurses = "libncurses6.dll"


# Relative path to `libpanel`
const libpanel_splitpath = ["bin", "libpanel6.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libpanel_path = ""

# libpanel-specific global declaration
# This will be filled out by __init__()
libpanel_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libpanel = "libpanel6.dll"


# Relative path to `libform`
const libform_splitpath = ["bin", "libform6.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libform_path = ""

# libform-specific global declaration
# This will be filled out by __init__()
libform_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libform = "libform6.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"Ncurses")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (Gettext_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (Gettext_jll.LIBPATH_list,))

    global libmenu_path = normpath(joinpath(artifact_dir, libmenu_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmenu_handle = dlopen(libmenu_path)
    push!(LIBPATH_list, dirname(libmenu_path))

    global libncurses_path = normpath(joinpath(artifact_dir, libncurses_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libncurses_handle = dlopen(libncurses_path)
    push!(LIBPATH_list, dirname(libncurses_path))

    global libpanel_path = normpath(joinpath(artifact_dir, libpanel_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libpanel_handle = dlopen(libpanel_path)
    push!(LIBPATH_list, dirname(libpanel_path))

    global libform_path = normpath(joinpath(artifact_dir, libform_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libform_handle = dlopen(libform_path)
    push!(LIBPATH_list, dirname(libform_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

