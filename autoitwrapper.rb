# Ruby Wrapper for the AutoItX3 DLL/COM interface
# Useful for automating Windows or testing programs
#
# Author::        Steven Heidel (http://www.livingskyweb.ca)
# Contributors::  All help is greatly appreciated
# Copyright::     Copyright (c) 2010 Steven Heidel
# License::       Distributes under the same terms as Ruby

# This module holds all classes, methods, and the all important
# WIN32OLE AI Object. Loading of this module will fail if the
# AutoItX3 program is not installed correctly.

module AutoIt
  
  require 'win32ole'
  require 'Win32API'
  
  # Make sure the DLL is registered
  begin
    AI = WIN32OLE.new('AutoItX3.Control')
  rescue
    raise "AutoItX3 is not installed properly"
  end
  
  
  # This class holds the clipboard object. Currently the new
  # method does nothing, use get and put to interact.
  
  class Clipboard
    
    # New
    # Returns:: nil
    def initialize
      # Perhaps some way of storing history could happen
    end
    
    # Get the last text copied to the clipboard
    # Returns:: text or 0 on error
    def get
      AI.ClipGet
      # FIXME: return false or raise error
    end
    
    # Use like "puts" to copy text to the clipboard
    # Returns:: nil on success or 0 on error
    def put(*args)
      string = ""
      args.each do |arg|
        string += arg.to_s
      end
      AI.ClipPut(string)
      # FIXME: return true and false or raise error
    end
  end
  
  
  # This class deals with the mapping of network drives.
  
  class DriveMap
    
    # New
    # Returns:: nil
    def initialize
      
    end
    
    def add
      
    end
    
    def get
      
    end
    
    def del
      
    end
  end
  
  
  # This class deals with ini files. The filename is stored so 
  # each instance should deal with a seperate ini file.
  
  class Ini
    
    # Checks to see if file exists then stores the filename
    # Returns:: 
    def initialize(filename)
      raise "Ini file does not exist" unless File.exist?(filename)
      @filename = filename
    end
    
    # Reads the key from a particular section
    # Returns:: the key or nil if not found
    def read(section, key)
      AI.IniRead(@filename, section, key, nil)
    end
    
    # Writes the value to the key in a particular section
    # Returns:: 1 on success, 0 on failure
    def write(section, key, value)
      AI.IniWrite(@filename, section, key, value)
      # FIXME: return true and false or raise error
    end
    
    # Deletes a key or section if no key is specified
    # Returns:: 1 on success, 0 on failure
    def delete(section, key = nil)
      if key.nil?
        AI.IniDelete(@filename, section)
      else
        AI.IniDelete(@filename, section, key)
      end
      # FIXME: return true and false or raise error
    end
  end
  
  
  # This class deals with pixels on the screen.
  
  class Pixel
    
    # New
    # Returns:: nil
    def initialize
      
    end
    
    def checksum
      
    end
    
    def get_colour
      
    end
    
    def search
      
    end
  end
  
  
  # This class deals with the keyboad and simulating key
  # presses. Refer to the AutoIt documentation for synthax
  
  class Keyboard
    
    # New
    # Returns:: nil
    def initialize
      # Perhaps setting a delay and other options
    end
    
    # Send a series of keys using strings
    # Returns::
    def send(*args)
      args.each do |arg|
        AI.send(arg.to_s)
      end
      # FIXME: check for errors
    end
  end
  
  
  # This class deals with deals with displaying tooltips. 
  # X and Y coordinates default to mouse position.
  
  class ToolTip
    
    # Begin to display a tooltip
    # Returns:: nothing
    def initialize(text, x=nil, y=nil)
      if x.nil? || y.nil?
        AI.ToolTip(text)
      else
        AI.ToolTip(text, x, y)
      end
      # FIXME: Check for existance of other tooltips
      # FIXME: Better support for multi-line tooltips
    end
    
    # Stops displaying the current tooltip
    # Returns:: nothing
    def destroy
      AI.ToolTip("")
    end
  end
  
  
  # Class description
  
  class TheClass
    
    # Method description
    def initialize
      
    end
  end
  
end