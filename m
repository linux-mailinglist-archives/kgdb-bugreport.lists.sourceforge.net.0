Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4C222374E
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 17 Jul 2020 10:43:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jwLxc-0006Jj-Ly
	for lists+kgdb-bugreport@lfdr.de; Fri, 17 Jul 2020 08:43:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mhiramat@kernel.org>) id 1jwLxb-0006JQ-N5
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 08:43:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=31wEowYsIzP+xZgbEmOH0uJk5LhOzunaBhPACf3hh+E=; b=jDU6/7XZwE1PPIAM5R6zSMDD1v
 xFW67JYsByC3jBVl1jqRtincJRMJGKA+BK/tnyswpUdhY/xqOQzIfSrid1p01SocY0sDaSL+DUxjj
 RkUt06pJmJXaPLp0JqfvWA9zakNz+vp7zWTntd6YXNsHHbw8ejywucr1L6Ge7KQz2XEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=31wEowYsIzP+xZgbEmOH0uJk5LhOzunaBhPACf3hh+E=; b=hlj8dZtnkomhb2L8YBsE8S8dJP
 l66er7o99JCfDnjR8+dXUUbIunriHtNZHTmR4RgzwZXSC+ndvkcpAjx/Fd13BPZEiAMD7aN1e9cxq
 V2y/AtCqN6sp1pChclKVlX6WS3CCLEZgD5wNf46MpvTFSw1UEdroHJRnYaoKCl4qA4Ec=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jwLxa-00BnZe-Jr
 for kgdb-bugreport@lists.sourceforge.net; Fri, 17 Jul 2020 08:43:15 +0000
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp
 [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2118D20691;
 Fri, 17 Jul 2020 08:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594975382;
 bh=I7vxFZDoj0pqymiF9vlc8if1+OKYk20nPgoNLb4Zcp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wFxzWOq+6oaxX+/chQSo2+ZusdS76ogf1iOij9/+Ujm6YqB0Lo4bIFW/0CXIC66oS
 1en4cKscxkw8cxcDhD4k1pxg6Xp3rNAIisUi8Bm4/rmlEQgVQx9+sm3838HkmITF6x
 CulefdtoUMda9FAMrSz/7jIti/9lrwlx2EsP8T4o=
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Ingo Molnar <mingo@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Date: Fri, 17 Jul 2020 17:42:55 +0900
Message-Id: <159497537541.145020.17311280984235736641.stgit@devnote2>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717171315.bdb7b5b230b0ed5aeeab8f71@kernel.org>
References: <20200717171315.bdb7b5b230b0ed5aeeab8f71@kernel.org>
User-Agent: StGit/0.19
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwLxa-00BnZe-Jr
Subject: [Kgdb-bugreport] [PATCH] kprobes: Remove show_registers() function
 prototype
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, kbuild-all@lists.01.org,
 pmladek@suse.com, Peter Zijlstra <peterz@infradead.org>,
 kgdb-bugreport@lists.sourceforge.net, sergey.senozhatsky@gmail.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Remove show_registers() function prototype because this function
has been renamed by commit 57da8b960b9a ("x86: Avoid double stack
traces with show_regs()"), and commit 80006dbee674 ("kprobes/x86:
Remove jprobe implementation") has removed the caller in kprobes.
So this doesn't exist anymore.

Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 include/linux/kprobes.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
index 45b8cdc9fad7..9be1bff4f586 100644
--- a/include/linux/kprobes.h
+++ b/include/linux/kprobes.h
@@ -227,7 +227,6 @@ extern int arch_prepare_kprobe(struct kprobe *p);
 extern void arch_arm_kprobe(struct kprobe *p);
 extern void arch_disarm_kprobe(struct kprobe *p);
 extern int arch_init_kprobes(void);
-extern void show_registers(struct pt_regs *regs);
 extern void kprobes_inc_nmissed_count(struct kprobe *p);
 extern bool arch_within_kprobe_blacklist(unsigned long addr);
 extern int arch_populate_kprobe_blacklist(void);



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
