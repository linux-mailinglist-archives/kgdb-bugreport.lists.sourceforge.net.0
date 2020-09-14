Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941C268BA2
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Sep 2020 15:02:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kHo7n-0000po-SY
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Sep 2020 13:02:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1kHo7m-0000pd-Re
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tOLZ70bedyzf8xgXzV0MTRrdMCvy/3UOdRHKK+GhNMo=; b=Ht+i+eOpAXl/eNiCWdKpnHS1RV
 GxBJ1fVW/rEkxlIB1YXZceoEFWGk1AU8mxBBcpsIHjhGec9aViuHHalBDQwjKbWO78JGbrUjswB4I
 SDlwMiSKtX1gd8FrBAqGvoXM+BawXygxmQ22GD2g1tyBCNkfa4S1LoXIuntVVj/uA0Zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tOLZ70bedyzf8xgXzV0MTRrdMCvy/3UOdRHKK+GhNMo=; b=KJcVf6twtzIwabxhGVDrId0+iX
 yeqKJfengtGK3lIkI6TeJVfaHcEe1OiSwUTLt8ttAH+bl5SoYhwsNGIne7691U1ubDh40DRZIBsNs
 fLWEk9bT6Kvmz5Xwpl+6v/dAHmKZD/dlw2SLYOl7mujcB6mO1gZokG6xJ0Gw1VNZgrXY=;
Received: from mail-wr1-f65.google.com ([209.85.221.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kHo7f-0099so-SA
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Sep 2020 13:02:26 +0000
Received: by mail-wr1-f65.google.com with SMTP id j2so18641983wrx.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Sep 2020 06:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOLZ70bedyzf8xgXzV0MTRrdMCvy/3UOdRHKK+GhNMo=;
 b=POu12cEaJFApnX2+rMx/2kxThtVNQIhVlX9u3uZHeXLJOzGppLaqXQdv+tPvj5R+xE
 tX780vtge+r4reu3udS1EdIs+vCSCvs8D/OznPjbRs9vgy+n5aPGJSYIbTB6XBJCv5nN
 Eo26ybzSJ1+gIxNxBFYRTZ8MiiuFtHMtM5t4awBHb5W7QJUXZGMexDV6XkZH+/ZibUR/
 c57u3FcVLQ9yVf6Pe0gAy47AMCdKNxJpebRjlWTpU6ea9Nj/lqnkyRtHq5C2oaTmtJUN
 vB+yien4dbtStTvDkZj+6qjtUCyixOMzrjEZpwkgJj94aR/1IDbIEu6Lo/fqksseLJT1
 Csmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOLZ70bedyzf8xgXzV0MTRrdMCvy/3UOdRHKK+GhNMo=;
 b=ra8wiSY7O9uxM9xUrU2bMhtJBODfn/JR58jvLCYUg3yBofdkTY+k8FfvRjQjsp1+8A
 88OnEIp9ZCUAYkEjFrO/YSGerS0EYF6LF3Ve6DZRKB+AE9CsjpHJaOPHtvUgmxeJZnv1
 /qN8r4nlEv6FzJ8CkY6U8u0rrKXPE1yBudE0WlrHqo1r4ZLZr4isTX4Lzf/rG8BtT2S0
 NDin6L5I5zWIzU3DBTfX/f+H3dP5QlxPK0JCe87xpq32PAxoAKQPJqmLPZ9MePJLI4Bn
 Iy/IyQMNrVp1v5XZH0D+DSPk3SPg8IvAzROh94PTKwH9LBYYtvQn2GAKmygRMLwg+CcQ
 zE8g==
X-Gm-Message-State: AOAM530OZg3qGKaBlfnkH5tzwD3ufidL2uRP93z6tqb5iSmm2Rhsr+52
 V0c9URIPqovWd8+DDqC23S4zvw==
X-Google-Smtp-Source: ABdhPJxdxolEdcYMjP3ctpO3wrxCQQtg4g3aiPudfFv1rQGBGhcDTJuT8gbgF3Z/w5SfmtM8lkj34w==
X-Received: by 2002:adf:f70d:: with SMTP id r13mr16395380wrp.317.1600088525276; 
 Mon, 14 Sep 2020 06:02:05 -0700 (PDT)
Received: from wychelm.lan
 (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id t6sm23420983wre.30.2020.09.14.06.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:02:04 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Sep 2020 14:01:43 +0100
Message-Id: <20200914130143.1322802-4-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914130143.1322802-1-daniel.thompson@linaro.org>
References: <20200914130143.1322802-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kHo7f-0099so-SA
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
---
 kernel/debug/debug_core.c       | 2 ++
 kernel/debug/gdbstub.c          | 1 -
 kernel/debug/kdb/kdb_debugger.c | 2 --
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 9618c1e2faf6..74d42d3f3180 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -763,6 +763,8 @@ static int kgdb_cpu_enter(struct kgdb_state *ks, struct pt_regs *regs,
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
