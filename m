Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E285B27A43F
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 27 Sep 2020 23:16:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kMe2A-0002aI-Nu
	for lists+kgdb-bugreport@lfdr.de; Sun, 27 Sep 2020 21:16:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kMe2A-0002a0-2p
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a99k07/EyDDQHmuhibQRaLo4XWgbxK6z35bVqiMsuv8=; b=VyRkwP3drI57bxIzUFRn0oUvRL
 7Q915S/CgwqoVZ6WshFEGyUll7LHwpdwl9ckyowdXhFNy1rCI8/WDUiNc6FjMW+Z7gYnamo/TTcZV
 lFSuqZRaKZ/IcQTtgcrX7LiYWjWQsrr3rSA7d8xgRirW7hLw390Tjx2dKYSqa7GZ6W9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a99k07/EyDDQHmuhibQRaLo4XWgbxK6z35bVqiMsuv8=; b=QXKZGAxJw5bN1Av2TjFpwLYQtB
 sWaJ/KknChe+1YAUOKRm/TLs2aMQnez8JIRvKBMU15MgYiuGRIngB4P36bVy+z2HRVTvBLBgkl21R
 Q2jUa9RW1HEeTGl61IlsTP4xEd6/MIh3Wpn2rVhFixZGMJkNnItP1sXY0uifPBBGz0wk=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kMe23-00Ah7t-D0
 for kgdb-bugreport@lists.sourceforge.net; Sun, 27 Sep 2020 21:16:38 +0000
Received: by mail-wr1-f68.google.com with SMTP id e16so9827683wrm.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sun, 27 Sep 2020 14:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a99k07/EyDDQHmuhibQRaLo4XWgbxK6z35bVqiMsuv8=;
 b=CjFXYG9BR8dkXSbiyxLxrUYbFRhjiOb1vcwmYg4vsW7360k60NHd/8S43UvXZA5FT5
 y5VyC5QYUXGmFaaGmwntXMTbUvqNhpSq3moC26ISTM5UAC+skTj4T6PO3hrzqrT6z15R
 hmAIvGK4AYwwCnEQeuzshHnQDATrFWpGn/iA1WzpjEShT3FvgfRikun4C5n3kerVeLUL
 1ASUSioryEuYeddzAzUwSfgNb8cD3KjYmuWABM8tEtkal6+cf2e68Low/keUuApsOV6f
 /6j0xr2ThzRu2LrBh/JoIfZRwmi19wGblaXZqiOMVOmiIOcQs99OXexE8U3y7loHj9U+
 9Zdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a99k07/EyDDQHmuhibQRaLo4XWgbxK6z35bVqiMsuv8=;
 b=YfqCjyc/jvIFVuXEPIAbqY4VHGfvbA515N3gWoLP8cB8CRQqpn2bGZhASwcdFxIXWg
 vXmx1PVHxaIWRB8BKb1OnqLXWf6YXkEdDQr3prjS67LySfJ+ycXvBfxjaoSkbKphh1Zd
 ro1M76OwBG0QS/ECmB1eQYA0mguvr9uCQeX03ZCRkJT9bXtGyeUBeXuY1K278QpAdmTl
 HeRILWvteXwFxNdbtwRCXwpYBflFbrGuZzBWu2vSbfv071dZUBvk6wIeNQ5XoUKGFr6j
 Vo34FrdqhEXa10MpIyDdAcGZ/8CTp0AIFTSlYrmqayaMTaN5ENR/HByz2UBzp5Z1PP25
 35ow==
X-Gm-Message-State: AOAM532g0PDjxgcewiUKjNzyVUO2tv5FUTFq6BOwN8+FXpxq/ab4cLoc
 JTY5IE1t7e5SFUYRuax3u9LEWQ==
X-Google-Smtp-Source: ABdhPJxsis82EaVU2Ny17vWSbD6xDjUxPFjWZp3tZqcI8T/hln1YFSfFswHXGrJGbExBNQLQpInGKQ==
X-Received: by 2002:a5d:51ca:: with SMTP id n10mr15438828wrv.222.1601241377872; 
 Sun, 27 Sep 2020 14:16:17 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id s17sm11396676wrr.40.2020.09.27.14.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 14:16:17 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Sun, 27 Sep 2020 22:15:31 +0100
Message-Id: <20200927211531.1380577-4-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200927211531.1380577-1-daniel.thompson@linaro.org>
References: <20200927211531.1380577-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.5 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kMe23-00Ah7t-D0
Subject: [Kgdb-bugreport] [PATCH v3 3/3] kernel: debug: Centralize
 dbg_[de]activate_sw_breakpoints
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

During debug trap execution we expect dbg_deactivate_sw_breakpoints()
to be paired with an dbg_activate_sw_breakpoint(). Currently although
the calls are paired correctly they are needlessly smeared across three
different functions. Worse this also results in code to drive polled I/O
being called with breakpoints activated which, in turn, needlessly
increases the set of functions that will recursively trap if breakpointed.

Fix this by moving the activation of breakpoints into the debug core.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/debug_core.c       | 2 ++
 kernel/debug/gdbstub.c          | 1 -
 kernel/debug/kdb/kdb_debugger.c | 2 --
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index faa1f99ce65a..e4339fd82db0 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -768,6 +768,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
 		}
 	}
 
+	dbg_activate_sw_breakpoints();
+
 	/* Call the I/O driver's post_exception routine */
 	if (dbg_io_ops->post_exception)
 		dbg_io_ops->post_exception();
diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index cc3c43dfec44..e9a9c3097089 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -1061,7 +1061,6 @@ int gdb_serial_stub(struct kgdb_state *ks)
 				error_packet(remcom_out_buffer, -EINVAL);
 				break;
 			}
-			dbg_activate_sw_breakpoints();
 			fallthrough;	/* to default processing */
 		default:
 default_handle:
diff --git a/kernel/debug/kdb/kdb_debugger.c b/kernel/debug/kdb/kdb_debugger.c
index 53a0df6e4d92..0220afda3200 100644
--- a/kernel/debug/kdb/kdb_debugger.c
+++ b/kernel/debug/kdb/kdb_debugger.c
@@ -147,7 +147,6 @@ int kdb_stub(struct kgdb_state *ks)
 		return DBG_PASS_EVENT;
 	}
 	kdb_bp_install(ks->linux_regs);
-	dbg_activate_sw_breakpoints();
 	/* Set the exit state to a single step or a continue */
 	if (KDB_STATE(DOING_SS))
 		gdbstub_state(ks, "s");
@@ -167,7 +166,6 @@ int kdb_stub(struct kgdb_state *ks)
 		 * differently vs the gdbstub
 		 */
 		kgdb_single_step = 0;
-		dbg_deactivate_sw_breakpoints();
 		return DBG_SWITCH_CPU_EVENT;
 	}
 	return kgdb_info[ks->cpu].ret_state;
-- 
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
