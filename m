Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE881EE219
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  4 Jun 2020 12:09:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jgmo3-0003wk-SO
	for lists+kgdb-bugreport@lfdr.de; Thu, 04 Jun 2020 10:09:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sumit.garg@linaro.org>) id 1jgmo2-0003wc-Hi
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 10:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWaxGGeqdBIuWfi0Pr0m5m/UNqCqE+K7xfquz67qpwE=; b=P9tHlzb8YR0TPb+NpYRZ4XTTfI
 MbONI2wu9z366AvePANS6Iwr2O8Wjfsf6IHQzO/9FQ5algumGBbhHLU1dW1dSMZSdIMWpNnLT5vRo
 KuQYPdb8ccQ/9QqLMVuLqa4q3qsQiu/H5fDx1Ds/cT2gzkZDjp5xpBdUwY+nF2KvfW4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SWaxGGeqdBIuWfi0Pr0m5m/UNqCqE+K7xfquz67qpwE=; b=Wq1JFNdIbaD72wT9r9PVCrTiRf
 uJpuCE+eGhLUf9GvWvIAF6lAKA2St3n3uhVARfFvPkQiJDKSEPNJQV3WLHsbpub0r1iwH9Px9tpOY
 SW4T9aIEEdnzCAnxvh8Jc3+6Ml6pF1v2ATTMdLwlMXpgfdJPM6rN70i9zU5oWc5w8pI4=;
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jgmnx-008W9A-Hr
 for kgdb-bugreport@lists.sourceforge.net; Thu, 04 Jun 2020 10:09:02 +0000
Received: by mail-oi1-f193.google.com with SMTP id b8so4601919oic.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 04 Jun 2020 03:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SWaxGGeqdBIuWfi0Pr0m5m/UNqCqE+K7xfquz67qpwE=;
 b=SYdCbuGB3J+72xEODNYeEFFubJezd+u5T6ELue2n2bkROzHd2EyydUBLmsE7tEE5IK
 mDLRPEOakhiDKP/h8VqX7TsibzreU/6CF7HFgmH+zXZYwaPCR54DUJeiy3fMy1YG63UI
 rK28OvFotjU0s+B/3q9D7X//OQHu9ZAdFKMWgqVQfJqOoLU9LaFNApnfxsG4YaaWD24c
 rhJ2VbxifJv8HJF7kgkmixaChgR5AlHXdX4A0vElchU932cv+DatjB3YJlfb4cr3+sGY
 1rlm7px04nPTYsYXd37BHB7bKDgqF+DSNLynDT1Mmv70C6Tx+Y+jsUTwO4DmNQ9e7RY4
 bMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SWaxGGeqdBIuWfi0Pr0m5m/UNqCqE+K7xfquz67qpwE=;
 b=Afn948zmnrSyngSZOzh9s91uc3JXo0cNA+hCKYP5hCYcO7fndIBFqEenbRJWMxo5TD
 En5UvEiax3oYzSioBPyo1V5Y5xBFW7B3w4zwwH7nisOo0Ci9HknKRAanW/ciWAeSGwPG
 4iAteyH28JZrTz9TO4z6C4XTw/nmDGFGdTW8F+gxnVS83kt/UK0fKQpZl0+8JfNFWBC5
 PCPaceFqAlH2q0tvLMPcibGnazIKH2rpUJhKOnAtu9M2s4358zasODo8C/9FNrDV7OAl
 NhX908dhSbaImwb5iV7hhDo1u7FQD4foGBTKPrUT/V7Zp1QKP6Vc678VirSnAOfzCymN
 9zbg==
X-Gm-Message-State: AOAM533LoqQSN43cVgWCjJaYgjk3tFwDyxVBSfzAHfTvbdYCZFmiftWf
 XNzXWPgwdc7fbYji22kEQkho+KS+frE=
X-Google-Smtp-Source: ABdhPJw0mqKUcRmUd840WqEdRfBHzQiTtI08e9dRTAOEKoLenr0WoeMdzZUbKKaoxlDGWF8PFm/7LQ==
X-Received: by 2002:a17:90a:aa8f:: with SMTP id
 l15mr5379447pjq.211.1591264917610; 
 Thu, 04 Jun 2020 03:01:57 -0700 (PDT)
Received: from localhost.localdomain ([117.252.66.248])
 by smtp.gmail.com with ESMTPSA id np5sm5786992pjb.43.2020.06.04.03.01.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jun 2020 03:01:56 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: daniel.thompson@linaro.org
Date: Thu,  4 Jun 2020 15:31:18 +0530
Message-Id: <1591264879-25920-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
References: <1591264879-25920-1-git-send-email-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.193 listed in list.dnswl.org]
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgmnx-008W9A-Hr
Subject: [Kgdb-bugreport] [PATCH v6 3/4] kdb: Make kdb_printf() console
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

Suggested-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Revieved-by: Petr Mladek <pmladek@suse.com>
---
 kernel/debug/kdb/kdb_io.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 58b7d25..0e4f2ed 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -562,7 +562,18 @@ static void kdb_msg_write(const char *msg, int msg_len)
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
