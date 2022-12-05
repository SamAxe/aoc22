import std;

int main( string[] args )
{
  assert ( args.length == 2, "Expecting filename on command line" );

string[] crates =
  [
  "",
  "QFMRLWCV",
  "DQL",
  "PSRGWCNB",
  "LCDHBQG",
  "VGLFZS",
  "DGNP",
  "DZPVFCW",
  "CPDMS",
  "ZNWTVMPC",
  ];


// [V]     [B]                     [C]
// [C]     [N] [G]         [W]     [P]
// [W]     [C] [Q] [S]     [C]     [M]
// [L]     [W] [B] [Z]     [F] [S] [V]
// [R]     [G] [H] [F] [P] [V] [M] [T]
// [M] [L] [R] [D] [L] [N] [P] [D] [W]
// [F] [Q] [S] [C] [G] [G] [Z] [P] [N]
// [Q] [D] [P] [L] [V] [D] [D] [C] [Z]
//  1   2   3   4   5   6   7   8   9 

  //move 1 from 9 to 2

  auto file = File( args[1] );
  auto lines = file.byLine;
  
  foreach( line; lines )
  {
    auto m = matchFirst( line, `move (\d+) from (\d+) to (\d+)` );
    writefln( "%s", m );

    auto q    = m[1].to!long;
    auto from = m[2].to!long;
    auto to   = m[3].to!long;

    assert ( from <= 9 );
    assert ( to <= 9 );
    assert ( crates[from].length >= q );

    crates[to] ~= crates[from][$-q..$].array.to!string;
    crates[from].length -= q;
    writefln ( "%s", crates );
  }

  writefln( "%s", crates[1..$].map!( str => str[$-1] ) );


  return 0;
}
