(ns epreuve2
  (:require [clojure.string :refer [join]]))

(defn most-frequent-letter
  "Finds the most frequent letter in the current column"
  [letter-counts]
  (def letters (keys letter-counts))
  (loop [letters letters max-count 0 the-letter ""]
    (if (empty? letters)
        the-letter
        (do (def letter (first letters))
            (def count (get letter-counts letter))
            (if (> count max-count)
                (recur (rest letters) count letter)
                (recur (rest letters) max-count the-letter))))))

(defn count-letters-per-col
  "Counts the occurrence of all letters in each column"
  [rows]
  (loop [all-letter-counts nil rows rows]
    (if (empty? rows)
        all-letter-counts
        (do (def row (first rows))
            (def row-counts (map (fn [letter] {letter 1}) row))
            (recur
              (if (nil? all-letter-counts)
                  row-counts
                  (map (fn [letter-counts1 letter-counts2]
                         (merge-with (fn [count1 count2] (+ count1 count2))
                                     letter-counts1
                                     letter-counts2))
                       all-letter-counts
                       row-counts))
              (rest rows))))))

(defn -main
  ""
  [& args]
  (println
    (join
      (map most-frequent-letter
           (count-letters-per-col
             (line-seq
               (java.io.BufferedReader. *in*)))))))

(-main)