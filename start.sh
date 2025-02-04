#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
��`�dappst eVXW�� I AE�UcP(�$>J�A	 %�A2�����qL����t��V>X5����S����Z�P��Z�Z1;�����ߝsϹ���?w�=�PN&�F^7:�PR]D���% �{���K��]A�����^�A��i�����~˜Y��/��(�� ���|�x�6m*Cl�r���5W��*DϞ��89���wjO�w����QZ��r p����&x-���p��V� �j���U��kG�6�`1�xN�h%N�xw!�`6�Vp5�h5�$m<j�D���7��d��U�l{ZŬɼ���&�A5�\�dI�@��d��)D1�Yk�b��d��q�{(�c�fݭ������j��&6��6۠K���O��A�9��j=b��:�}�,��U<O�̾nh;1�*5[�	L�5�Z�Y��6&���R抏�u1���;<��lN'�Z׿��З�����pm�ζ��clyN���I퓂$q3~1"3�j����w����ƶ��4�:Z߲#�pV��Db�o{GF�����i�|��~�q�t�z�ܟF�x�R�J,��/󝒵Ѷkc�ӧGfCK��Dm�Sc6c���R��x�}�ԣ͈�ϯ0�<��2+�-&�Q���o�|v�eԪ:�K��U��W,c���z��|�*�;nŢz:P�z�� �m�Dl,N��j^��������vPpc����� p�1G�5ڪt̸_4w���yZ���o쑾���~Y�I���n�c]��N�����~����4�W�e���w������5�u.bL�Cmo��-�Y����ȯ6Y�����q��+U����y
Y���<�����SA�L�{i�*�*��;����X<�={6�eNc�<fy����|R���,�J��i����p29��o]�`�v�"g�}Q��X�������#�7�8�rK�&�t�������t4$U Ξ3\~�ʀ��YM3T�f�{PQeڲ��E^DQr`��m����4T=Ơ9��ď�ł{jO����\0Q0ڮh���^mjӪLJ���C��bc��s����)Յ��C�~˗ʳjtl�aS<&@ddm�y�Qy�0�Sm��γ������*NH����m~f����A���cKb�/�\g9�;����>�G�߻�˜��1~'Aɲ'or�-[���?Qߠ\UR��u�V}�g1�Ο<t8�W!(���J��t�U�+��i	Fִ���aݎɻ���5Ru6��c�G��d���oK���&%�E��T]v�I�+�
�+��z~��U��d�4�kW|t^�0E�&c-q�D�DQW�����#��+�r�V�*J�
�IGny
G�%OM�u�����R9R�V��g!�I����+�Y=��T�7/.S�;�
(7S��1d��f�
te�`!Vh�)ԋ��u%U5���Һ����'�,����Q��rD��Kw�Q\���O�~3���Т[�-�u�f�uK��75�oÌ����-4�kmg�q<m�����tY6Eb�0���o͋�YAaC��`Cض$�I�;��Mc�c�����݁+�>ɡ�I�bnd�Ž�D���I��{�w;o�x��56��r�Ⲵ��}`��q*#:,f X��YTn��2�O�FO#�\�� �rc��\���nHcc�ƀLg�|Z/HLq��|t��@�ݣ����nZ/2��^�H�����g9��\�x�E����������3�iz����u\��������U�6��ɓ-����1$���b8�i���Y97�O΍��em����D���g��:� w�Yg��r�u�$G�J]I�D�T�z-H�jWh��*'-|j�^Q+�^1�
�㙵(ȥ�i$>�$�@γXkl�
=
�̋�bqr�H J�é���y��he�ʴ��V���(_��Ի^����3�U�]�֒�����2O4�_\K�L�����������2�W?D͞P����9��l�~���}��S��)*z�{e�3BɄ���n�\���t�]���.�[� 8�T��]�k�o�z�����:�9K���E����K.��C^���|��eǨ��P.�׈�`B�R�K�KJ0�w�t�/<�Ǚ�8���iҨ�Mn���8�D"�݁?��(�B�pm)L#�� �Mp e��7����J�-���08�v��(���q�Ö���\g�Jm��(�g������������ �3��.�מ/�K��;}/�����P=���!��O��zBq���$�R�9};8QQ�)'W�Hq<y�2ܡ~�f�:^C$M}	�Ǉ�
+}a	m��0�Ś`�'#)b��Q4x���3t�A҂�<0 {�����(���~~�SOz��oF|k\�6=	��m��7\ ���XX�3*`z�����2��ꥳ�����h��ž��bN��$/�ի��q&����P�j�w���I�~�L(���PJ၎�BL����Р`��	��Ud�)��@��m/6ً�.�L�'�<y�{�e��R���?�EuA�I��ѽ>�wwA�T&��ʷ���k2}��/��x��	�d�MDɳ�����K<T�윱}y���en��C�o1C�q'EN���@��~_]���D�F*>�o�/Z��  