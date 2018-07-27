# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
[
  'Abergavenny (Monmouthshire Citizens Advice)',
  'Ammanford Library',
  'Bargoed (Caerphilly Citizens Advice)',
  'Brynmawr Citizens Advice',
  'Caldicot (Monmouthshire Citizens Advice)',
  'Cardigan (Age Cymru)',
  'Carmarthen Citizens Advice',
  'Carmarthen (CAVs)',
  'Chepstow (Monmouthshire Citizens Advice)',
  'Cwmbran (Torfaen Citizens Advice)',
  'Haverfordwest (Pembrokeshire Citizens Advice)',
  'Merthyr Tydfil (Citizens Advice)',
  'Neath Library',
  'Newport (Citizens Advice)',
  'Pontypridd (Rhondda Cynon Taff Citizens Advice)',
  'Swansea Citizens Advice',
  'Wrexham (BAWSO)',
  'Caernarfon (Citizens Advice)',
  'Canolfan Ni Corwen (Extended Advice Service)',
  'Llandudno (Cylch Conwy District Citizens Advice)',
  'Llangefni (Ynys Mon Citizens Advice)',
  'Mold (Flintshire Citizens Advice)',
  'Pwllheli (Gwynedd Citizens Advice)'
].each do |location|
  Location.find_or_create_by!(name: location)
end
