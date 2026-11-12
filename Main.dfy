include "lib/Sorting.dfy"

// Construiește o List<int> dintr-o secvență Dafny, ex. [5, 2, 9]
function FromSeq(s: seq<int>): List<int>
  decreases |s|
{
  if |s| == 0 then Nil else Cons(s[0], FromSeq(s[1..]))
}

// Transformă o List<int> înapoi în secvență, ca să se afișeze frumos
function ToSeq(xs: List<int>): seq<int> {
  match xs
  case Nil => []
  case Cons(x, tail) => [x] + ToSeq(tail)
}

method Test(s: seq<int>) {
  var xs := FromSeq(s);
  print "input:          ", s, "\n";
  print "InsertionSort:  ", ToSeq(InsertionSort(xs)), "\n";
  print "MergeSort:      ", ToSeq(MergeSort(xs)), "\n\n";
}

method Main() {
  Test([]);
  Test([7]);
  Test([5, 2, 9, 1, 5, 6]);
  Test([10, 9, 8, 7, 6, 5, 4, 3, 2, 1]);
  Test([3, -1, 4, -1, 5, -9, 2, 6]);
}
