
import std.stdio;
import std.file;
import std.algorithm;
import std.range;
import std.array;


// Opponent          We choose
// ------------------------------
// A is rock         Y is paper
// B is paper        X is rock
// C is scissors     Z is scissors

// points for shape
//                   X = 1 
//                   Y = 2
//                   Z = 3
// points for game
//  lose 0
//  tie  3
//  win  6

long score( char[] round )
{
  long pts = 0;
  switch ( round )
  {
    case [ 'A', 'X' ] : pts = 1 + 3; break;
    case [ 'A', 'Y' ] : pts = 2 + 6; break;
    case [ 'A', 'Z' ] : pts = 3 + 0; break;

    case [ 'B', 'X' ] : pts = 1 + 0; break;
    case [ 'B', 'Y' ] : pts = 2 + 3; break;
    case [ 'B', 'Z' ] : pts = 3 + 6; break;

    case [ 'C', 'X' ] : pts = 1 + 6; break;
    case [ 'C', 'Y' ] : pts = 2 + 0; break;
    case [ 'C', 'Z' ] : pts = 3 + 3; break;
    default: assert(0);
  }
  return pts;
}


int main( string[] args )
{
  assert( score( [ 'A', 'Y' ] ) == 8 );
  assert( score( [ 'B', 'X' ] ) == 1 );
  assert( score( [ 'C', 'Z' ] ) == 6 );

  auto file = File( args[1] );
  auto lines = file.byLine;
  long total = 0;
  foreach( line; lines )
  {
    auto choices = line.split;
    assert( choices.length == 2 );

    auto s = score ( [ choices[0][0], choices[1][0] ] );
    total += s;
  }

  writefln( "Total score is %s", total );

  return 0;
}
