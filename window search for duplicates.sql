SELECT /*+ parallel(8) */ * 
FROM (
      SELECT to_char(wtime, 'mmdd'),
      COUNT(*) OVER (PARTITION BY email,
                                  to_char(wtime, 'mmdd'),
                                  oper_id ORDER BY email
                                  ) doub,
      ml.* 
      FROM cch2.ss$messages_log ml
      WHERE knt_id =993634 
      AND draft_id IN (484,487)
      AND wtime> '01112022'
     
) ms
WHERE ms.doub=2
