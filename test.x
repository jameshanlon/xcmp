val ct_eom = 1;

chan tree; % 70000
chan cb;   % 20000

proc main() is
  var v;
{ tree[100] := #DEADBEEF;
  tree[31000] := #BABECAFE;
  tree[62000] := #DEADBABE;
  v := tree[100];
  v := tree[31000];
  v := tree[62000];
  cb[1000] := #FFFFFFFF;
  cb[19000] := #00000000;
  v := cb[1000];
  v := cb[19000];
  tree !! ct_eom
}

