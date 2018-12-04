
Prompt selecccionar la PDB para validar
connect ilap_bdd/ilap_bdd@&pdb

whenever sqlerror exit rollback;

set serveroutput on

Prompt creando procedimientos para validar

create or replace procedure p_valida_eliminacion wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
12e 150
VCy3PwxNBZnHyIxeEYFy7mWT1U4wg0xK1ydqfC9GEg2vu0t4BY858yOZy4Vh8eN78bPQZOYa
6OcJrRZrsHrPQyVnfTg4yXU6tDWlp/WjL1N1IBKfLDxZF/5DNAC+MR+T7F/oQ+w+DnR1It+i
w3yrAhMclrPj6RLd4JBjbGlYY7IxXm/q9ep6QLo2bE0dkwaicMX0r2pQ62/Vl1io5rjMNOLz
5iBc0Ul15N4zxHBqiqgP3/pz+XBzMXYV0inixHwPC3MmgfjqvvRB0vFWUrF2Y+6jsqM7BlhB
ZQldMkwgN53qqUFaH/1WXbV82B1FbcUY19koAWxpbw==

/
show errors


create or replace procedure p_valida_eliminacion_main wrapped 
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
c8f 254
LeuYO72bmyeb/ppqR2c7g07JHWkwg+2nNSCsfARnvz3btVATRTBQrEmu4zL2rJWJFQ3ebtns
ygRnqrUEl+DCVin+bP3qfRI3vD84lobIeQn6hZMPLkiaXyKLM5GZx0sBa67Ub0ZJjO7K6zhu
numiRbqCrZNHF04pJyFxAx/RgwXW7so485mUKRwTeq69H8Ubc8I7X78UoWrDGzUaxG2fKXBk
A8oGE2cD47tT5+YcbfoQr35xD8uc5d++Pw9fnVnKIgKlPm67Nc4Z8CjTzi83KBD7vzCAObtk
nlHjobTfeBty0JTJxBL96bQWg4uofuPTI5DQUHOEHw6unH9r4VSUsQuzBFmOvx8CmBY8Q69M
48q5ZSzR+Ph2brfjrO0Y/tw+XYtoiRdn4QATRQM+ic2+AwAWBb8X+GkzJZDt9dxOOb9sJBrm
g9kmgBuCGcIhyhOSVEx5+CiMr3PkS8xG8FF5HBWLa3kiFYvveXA91+uylOFNbm1IYJcrdAR8
YX3UkT2DrwOLs1rMYJIQVm6LwdWuw1ZCBB6iRMUuykmGajwukzGEJh7UIZyrP+Y/LYw9kJz0
1/wptgRAP8k=

/
show errors


Prompt ======================================
Prompt Iniciando validacion - Delete
Prompt ======================================

exec p_valida_eliminacion_main


prompt Listo!
exit



