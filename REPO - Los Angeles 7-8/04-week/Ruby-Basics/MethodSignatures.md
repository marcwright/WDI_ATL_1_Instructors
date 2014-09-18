#Method Signatures
<table>
<tr><th>Argument type(s)</th><th>Method signature</th><th>Sample call(s)</th><th>Variable assignments</th></tr>
<tr><td>Required (R)</td><td>def sample(a, b, c)</td><td>sample(1, 2, 3)</td><td>a = 1, b = 2, c = 3</td></tr>
<tr><td>Optional (O)</td><td>def sample(*a)</td><td>sample(1, 2, 3)</td><td>a = [1, 2, 3]</td></tr>
<tr><td>Default (D)</td><td>def sample(a=1)</td><td>sample<br/>sample(2)</td><td>a = 1<br/>a = 2</td></tr>
<tr><td>R/O</td><td>def sample(a, *b)</td><td>sample(1)</td><td>a = 1, b = [ ]</td></tr>
<tr><td>R/D</td><td>def sample(a, b=1)</td><td>sample(2)<br/>sample(2, 3)</td><td>a = 2, b = 1<br/>a = 2, b = 3</td></tr>
<tr><td>D/O</td><td>def sample(a=1, *b)</td><td>sample<br/>sample(2)</td><td>a = 1, b = [ ]<br/>a = 2, b = [ ]</td></tr>
<tr><td>R/D/O</td><td>def sample(a, b=2, *c)</td><td>sample(1)<br/>sample(1, 3)<br/>sample(1, 3, 5, 7)</td><td>a = 1, b = 2, c = [ ]<br/>a = 1, b = 3, c = [ ]<br/>a = 1, b = 3, c = [5, 7]</td></tr>
<tr><td>R/D/O/R</td><td>def sample(a, b=2, *c, d)</td><td>sample(1, 3)<br/>sample(1, 3, 5)<br/>sample(1, 3, 5, 7)<br/>sample(1, 3, 5, 7, 9)</td><td>a = 1, b = 2, c = [ ], d = 3<br/>a = 1, b = 3, c = [ ], d = 5<br/>a = 1, b = 3, c = [5], d = 7<br/>a = 1, b = 3, c = [5, 7], d = 9</td></tr>
</table>