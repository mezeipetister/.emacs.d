(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil
                    :height 0.7)
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'calendar-iso-week-face))

(setq calendar-week-start-day 1
      calendar-day-name-array
       ["vasárnap" "hétfő" "kedd" "szerda"
        "csütörtök" "péntek" "szombat"]
      calendar-month-name-array
        ["Január" "Február" "Március" "Április" "Május" "Június"
         "Július" "Augusztus" "Szeptember" "Október" "November" "December"])
