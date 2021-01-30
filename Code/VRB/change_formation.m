function change_formation(actual_formation)
switch(actual_formation)
    case line
        I.formation = 'quad';
    case 'quad'
        I.formation = 'line';
end
end
