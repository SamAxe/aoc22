import std.stdio;
import std.file;
import std.array;
import std.conv : to;
import std.algorithm;

void main( string[] args )
{
  assert( args.length == 2, "Expect 1 filename arg" );
  auto file = File( args[1] );
  auto lines = file.byLine;

  long sum = 0;
  long[] amounts;

  foreach( line; lines )
  {
    if ( line.empty() )
    {
      amounts ~= sum;
      sum = 0;
      continue;
    }
    sum += line.to!long;
  }
  amounts ~= sum;

  writefln( "Max element (0 based) is at %s with %s", amounts.maxIndex, amounts.maxElement );
  writefln( "%s elves", amounts.length );
}
