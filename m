Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD891E7BB8
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 29 May 2020 13:27:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jedB3-00011Z-No
	for lists+kgdb-bugreport@lfdr.de; Fri, 29 May 2020 11:27:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jedB1-000112-GF
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=swXPGMrzCEsQLDtOomMfEMI5zRSTvjf8q0XZ57NNdwQ=; b=ReJ0Grk9gBtmqKCJ3SqNzC74XK
 faMAUbgI2UHbWikJG4bIn9hz7V7kXOCyWsXo8aAXF5lHC66bq5BGiX4WWnUTGfJ8MJBS9+wudaOBt
 nO4WepJ5bLiVvbY2mt4LWQaHv3Aj6skki6TNOvYL96L0TapsJuhqE45LyrypycKC6JTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=swXPGMrzCEsQLDtOomMfEMI5zRSTvjf8q0XZ57NNdwQ=; b=jD/goP23eA1dENQr42P7UxzrC0
 fMAUSyXrC6pTasuK9oHpih7/nNED8VVC+WY94mxGrcVROEt3I4JpYl5bSC7XGX4IaNYMZuriySVGb
 DK07XKjOEccDRS/uoPS3jUzDOiqNfh2OHM2KCLkfY6KV/iBrDuCnj7c+wuQe1iCeVVm0=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jedAr-00CBny-R7
 for kgdb-bugreport@lists.sourceforge.net; Fri, 29 May 2020 11:27:44 +0000
Received: by mail-pf1-f193.google.com with SMTP id 131so1235225pfv.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 29 May 2020 04:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=swXPGMrzCEsQLDtOomMfEMI5zRSTvjf8q0XZ57NNdwQ=;
 b=cTntY+QP7be+KCZ3TmD3G+ZmCEJTyACPPKqh2zbGHf6TTf1vlDeMuZgJO3O+/yLT/b
 VrWg+hXVkn98YCY8v/zOyzKGb9uN5TU0eVylsq9kNnKyREVfvU1B0zeNuxnC835XV2aL
 8jFexlrTTmbsOccFNv6Me65nM5nD/oh6a0T6rK4v5PJW0nc3ZZ51yUe0cT5YB14f0pw5
 nocjZCF2mLqp9UVZMNqHIT8aeScGfMaD+OOi3KltXiQBPya9SX2387AetuSs0d9FjhoO
 ugRvO7m/rWHwQ14gklIx1bqhblOgnwhMHTIZLyZNZOed1HNYmgCoHaZOHyg4j8v1GMO2
 dDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=swXPGMrzCEsQLDtOomMfEMI5zRSTvjf8q0XZ57NNdwQ=;
 b=hh2Yb9S92z4JtY0HI+1WMKQaBgKE9ZBI2FtJE0eADy48+/S7iLmyzl5zFG7wGVyCnB
 pOZGTFJ9V+RIy3PhLWgqImWwnNNiDrDDNbGLgp9NQ5BMNfUynoVH2VhUZ++B1e+qPOKB
 9uC9PZsrz9V35eHRsAYENTMdOdUnUi5t1dzUENEBL1GYfgS6wVZKTuQLyU12nzj5iBFH
 HV7lCToa1nAeXxbXDNqfIMrNcpkCtGWJ/lMJo3pdjmGxTE7qPxDFJuZgg1PgeircK081
 sorUO3Fs6POAGYHly7Tu8y6JOOcJj9KaAa+O2f080CSb/NUxKWwOXan22RB5eua+cpgs
 ldmQ==
X-Gm-Message-State: AOAM533TMB5lHF3AfKU4VQljdYXxSpHsZAL1DkkbHoDrXj7Kre85aPCg
 uH2uXDcX4nz2/gc4vNdMKGGeLg==
X-Google-Smtp-Source: ABdhPJzRFOc862JgIEx+A0mSz9srzgGZ4R0z9zW75evtV1vuGUT/6zFHIAoUTXkiLE+CpLE2Grmhig==
X-Received: by 2002:aa7:9a0e:: with SMTP id w14mr8332032pfj.288.1590751656230; 
 Fri, 29 May 2020 04:27:36 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id w190sm7016741pfw.35.2020.05.29.04.27.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 29 May 2020 04:27:35 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Fri, 29 May 2020 16:56:46 +0530
Message-Id: <1590751607-29676-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
References: <1590751607-29676-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jedAr-00CBny-R7
Subject: [Kgdb-bugreport] [PATCH v4 3/4] kdb: Make kdb_printf() console
 handling more robust
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: pmladek@suse.com, kgdb-bugreport@lists.sourceforge.net,
 jason.wessel@windriver.com, linux-kernel@vger.kernel.org,
 sergey.senozhatsky@gmail.com, gregkh@linuxfoundation.org, jslaby@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

While rounding up CPUs via NMIs, its possible that a rounded up CPU
maybe holding a console port lock leading to kgdb master CPU stuck in
a deadlock during invocation of console write operations. A similar
deadlock could also be possible while using synchronous breakpoints.

So in order to avoid such a deadlock, set oops_in_progress to encourage
the console drivers to disregard their internal spin locks: in the
current calling context the risk of deadlock is a bigger problem than
risks due to re-entering the console driver. We operate directly on
oops_in_progress rather than using bust_spinlocks() because the calls
bust_spinlocks() makes on exit are not appropriate for this calling
context.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index fad38eb..9e5a40d 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -566,7 +566,18 @@ static void kdb_msg_write(char *msg, int msg_len)
 	for_each_console(c) {
 		if (!(c->flags & CON_ENABLED))
 			continue;
+		/*
+		 * Set oops_in_progress to encourage the console drivers to
+		 * disregard their internal spin locks: in the current calling
+		 * context the risk of deadlock is a bigger problem than risks
+		 * due to re-entering the console driver. We operate directly on
+		 * oops_in_progress rather than using bust_spinlocks() because
+		 * the calls bust_spinlocks() makes on exit are not appropriate
+		 * for this calling context.
+		 */
+		++oops_in_progress;
 		c->write(c, msg, msg_len);
+		--oops_in_progress;
 		touch_nmi_watchdog();
 	}
 }
-- 
2.7.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
