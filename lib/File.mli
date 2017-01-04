(* *********************************************************************)
(*                                                                     *)
(*              The Compcert verified compiler                         *)
(*                                                                     *)
(*          Xavier Leroy, INRIA Paris-Rocquencourt                     *)
(*      Bernhard Schommer, AbsInt Angewandte Informatik GmbH           *)
(*                                                                     *)
(*  Copyright Institut National de Recherche en Informatique et en     *)
(*  Automatique.  All rights reserved.  This file is distributed       *)
(*  under the terms of the INRIA Non-Commercial License Agreement.     *)
(*                                                                     *)
(* *********************************************************************)

val safe_remove: string -> unit
   (** Remove the given file if it exists *)

val temp_file: string -> string
    (** Generate a temporary file wiht the given suffix that is removed on exit *)

val output_filename_default: string -> string
   (** Return either the file specified by -o or the given file name *)

val ensure_inputfile_exists: string -> unit
   (** Test whether the given input file exists *)

type input_file
   (** Type for input files *)

val input_name : input_file -> string
   (** Return the name of the input file *)

val new_input_file : string -> string -> input_file
   (** Return a new input_file from a given file with extension *)

val open_input_file : input_file -> in_channel
  (** Open an in_channel from the input file *)

val output_filename: ?final:bool -> input_file -> string -> string
   (** Determine names for output files.  We use -o option if specified
       and if this is the final destination file (not a dump file).
       Otherwise, we generate a file in the current directory. *)

type process_outfile
   (** Type for the output of the external processes *)

val pipe_process_outfile : unit -> process_outfile
   (** Generate a new pipe as output for an external process *)

val tmpfile_process_outfile : string -> process_outfile
   (** Generate a new temporary file for external process output *)

val file_process_outfile : ?final:bool -> input_file -> string -> process_outfile
  (** Generate a new out file for external process output *)

val in_channel_of_outfile : process_outfile -> in_channel
  (** Get an in_channel from the process_outfile *)

val out_descr_of_outfile : process_outfile -> Unix.file_descr
  (** Get the out file descriptor from the prorcess_outfile *)

val safe_remove_outfile : process_outfile -> unit
  (** Remove the process_outfile *)

val get_outfile_name : process_outfile -> string
  (** Get the name of the underlying file (returns - for pipes) *)
