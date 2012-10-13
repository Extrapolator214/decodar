class Decodar::Parser
  # Records:
  # ====
  #
  # 0:    Header
  # 1:    Old balance
  # 2:    Movement
  # 3:    Additional infos (on preceding record 2)
  # (4):  Free communication
  # 8:    New balance
  # 9:    Trailer record
  #
  # Empty file: record 0 (header), 1 (old_balance), 9 (trailer)
  #
  # Transactions
  # ====
  #
  # Each transaction get its own code:
  # +-------------+---------------+----------------+---------------------+
  # +    1st      +   2nd + 3rd   +   4th + 5th    +  6th + 7th + 8th    +
  # +=============+===============+================+=====================+
  # | record type |     family    | transaction    |  category           |
  # +-------------+---------------+----------------+---------------------+
  #
  # Type
  # ---
  # |0| | | Simple amount without details
  # |1| | | Amount totalised by the customer
  # | |5| | Detail of 1
  # |2| | | Amount totalised by the bank
  # | |6| | Detail of 2, simple amount without detailed data
  # | |7| | Detail of 2, simple amount with detailed data
  # | | |9| Detail of 7,
  # |3| | | Simple amount with detailed data
  # | |8| | Detail of 2
  #
  # Family
  # ---
  # Broad division a transaction belongs to
  #
  # Transaction
  # ---
  # Identify a transaction within a family, for each family, there are a number of
  # debit/credit transaction code
  #
  # Category
  # ---
  # Additional info about the nature of the transaction, clearly distinguishes
  # the different item relating a single transaction
  #
  # Note: For unclassified transaction, the 39 or 89 code should be given into the
  # 30 family
  # In each family, 40-48 & 90-98 are reserved for transaction proper to each bank
  # 49 & 99 identify corrections and cancellation entries
  #
  # Structured communications
  # ---
  # May occur in record 2 (movement) or in record 3 (information)
  # Communication format zone indicate wether it is free (0) or structured (1)
  # When structured: A three position code indicate the type of communication
  #
  # Other code
  # ---
  # Separate application: Specify the content of the file agreed with the customer
  # Version code: Specify the version of the standard
  # Multiple file code: It is possible to record multiple file on one physical file
  #   1: Another file is next
  #   2: Last file

end