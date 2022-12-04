import std;

int main( )
{
  auto file = File( "input" );

  long extra = 0;
  foreach( line; file.byLine )
  {
    // 75-76,18-75
    auto m = line.matchFirst( `(\d+)-(\d+),(\d+)-(\d+)` );

    auto x1  = m[1].to!int;
    auto x2 = m[2].to!int;
    auto y1  = m[3].to!int;
    auto y2 = m[4].to!int;

    if ( max(x1,y1) <= min( x2,y2 ) )
    {
      writefln( "#1 %s", line );
      extra++;
    }
  }

  writefln( "Extras are %s", extra );

  return 0;
}
