#!/bin/bash

analyze_logs() {
    input_folder="$1"
    output_file="$2"

    echo "Level,Count" > "$output_file"

    error_count=$(grep -E "ERROR" "$input_folder"/*.{log,txt} 2>/dev/null | wc -l)
    warning_count=$(grep -E "WARNING" "$input_folder"/*.{log,txt} 2>/dev/null | wc -l)
    info_count=$(grep -E "INFO" "$input_folder"/*.{log,txt} 2>/dev/null | wc -l)

    echo "ERROR,$error_count" >> "$output_file"
    echo "WARNING,$warning_count" >> "$output_file"
    echo "INFO,$info_count" >> "$output_file"

    echo ""
    echo "Most common error messages:"
    grep -E "ERROR" "$input_folder"/*.{log,txt} 2>/dev/null | cut -d' ' -f4- | sort | uniq -c | sort -nr

    echo ""
    echo "Report saved to $output_file"
}

analyze_logs "logs" "reports/summary.csv"
