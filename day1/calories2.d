// dmd -run calories2.d input

import std.stdio;
import std.file;
import std.array;
import std.conv : to;
import std.algorithm;
import std.range;

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
    }
    else
      sum += line.to!long;
  }
  amounts ~= sum;

  auto sorted   = amounts.sort;
  auto topThree = sorted.retro.take(3).sum;
  writefln( "top three total snacks is: %s ", topThree );
}
