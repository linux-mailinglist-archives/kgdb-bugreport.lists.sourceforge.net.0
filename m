Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D4994E8F8
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 12 Aug 2024 10:54:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sdQom-0002Ve-DG
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 12 Aug 2024 08:54:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mail@florommel.de>) id 1sdIJs-0006ba-GB
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 11 Aug 2024 23:49:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uYjCP7UXLF4DdjV7606xxZ82CC5pSdMtpBCsqR8XzSE=; b=TY/3tvSrZKeqoAB+nsrPR0JNp2
 WAqzdkUb/fyAbLXZGNY46SwrvFxRfXomv5VUVjc6xIbW4r4thcDmtaYtS4cG0Fp1CKVBypk3a/QIE
 fixkKRO0S49FSzzfhR5ESp17rS0hFsonimiRkWQr0Uxem7lvAnQ5Jw+64C4Es27OmtEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uYjCP7UXLF4DdjV7606xxZ82CC5pSdMtpBCsqR8XzSE=; b=X41N47dRs9R3qXRmgJitj+XxaJ
 sFvj2o1TE8s1g6orWFxIqcMpwC/Q263vOWJTFs0N2aIpT1CryV8vINmYwYW/+Gg5Cm2Pj/MBK8nlX
 ZqL4O4Q+GBOPLysilgXMW3/+R7Uy+LoA5Kp7T/+5WvqbEBQI1HGe3qj77gg8O3kbRvD8=;
Received: from read.uberspace.de ([185.26.156.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdIJq-0007Fw-V9 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 11 Aug 2024 23:49:51 +0000
Received: (qmail 9135 invoked by uid 990); 11 Aug 2024 23:22:58 -0000
Authentication-Results: read.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by read.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Mon, 12 Aug 2024 01:22:58 +0200
From: Florian Rommel <mail@florommel.de>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Lorena Kretzschmar <qy15sije@cip.cs.fau.de>,
 Stefan Saecherl <stefan.saecherl@fau.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Randy Dunlap <rdunlap@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 kgdb-bugreport@lists.sourceforge.net, x86@kernel.org,
 linux-kernel@vger.kernel.org
Date: Mon, 12 Aug 2024 01:22:08 +0200
Message-ID: <20240811232208.234261-3-mail@florommel.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240811232208.234261-1-mail@florommel.de>
References: <20240811232208.234261-1-mail@florommel.de>
MIME-Version: 1.0
X-Rspamd-Bar: ---
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MID_CONTAINS_FROM(1)
 MIME_GOOD(-0.1) BAYES_HAM(-2.887071) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -3.987071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=florommel.de; s=uberspace; h=from:to:cc:subject:date;
 bh=83ni0oxgvU7wO3TGJK4AznLbgJf+G+hKoJ+YstNEvTc=;
 b=yTRAEKNfu1DizVL9DZp9uTn697ofRBui9cOjT13fsPEl2wk0mZ8VMKLxbCwDm9LE/xraa+LilK
 xkuBOCGh2wg9jBunAPd/pGpWp3c2DLS/IahJoY5MT2At3OsiIj/9yv6vfTmEKy+d1TBIrxcwOjza
 SY/bAhv+BE6ohili6YsSh/l0NJv8ueyYFtIHsoV6qJ4vACEdw1iOwbp7DG4k4okloO4+U5Xhi3Gu
 gfKonjkdwqjtqXqZiOp4ZGqU3b78MmwHUj1bznmcJmMVAjDyQdP2l/asruvG5OTUJNpI3bKw2Lo7
 BWFU4NeVZSh5sI+H4cP003mI+plpSHvhI/qCm//JtMEkNDumD/3hZOULvL39X1eTPPtWklJ6j7vM
 tcdbZREELmIy48Bkfxdl9Fig+EOucGNedN0fTU93srnjUuDIXw7iFxjMkZplJvzuxemS0wheK6TG
 YgXJU1Euz64JZMoccHy6crRTWTQcb87ewqAbI61J2zbyinq3qLt7d6YkBxTqTfsj/zdFw3Kg5xF4
 MtNDA23Y20WbGc5zzQpo7zr79uO7h9FxHH8QUVEpfoHoYl7vgqXdgb1cclIlot9ezVog9qFXsaSG
 shuLUtOJYYS0+MAMKS0FiyBMb9ZXypikP7Up9EYwdqdrrOIOljW5ES+Oo71MiAr83ks3TSW8G4d5
 k=
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On x86, occasionally, the removal of a breakpoint (i.e.,
 removal
 of the int3 instruction) fails because the text_mutex is taken by another
 CPU (mainly due to the static_key mechanism, I think). The fu [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.26.156.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: florommel.de]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdIJq-0007Fw-V9
X-Mailman-Approved-At: Mon, 12 Aug 2024 08:54:17 +0000
Subject: [Kgdb-bugreport] [PATCH 2/2] x86/kgdb: fix hang on failed
 breakpoint removal
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
Cc: Florian Rommel <mail@florommel.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On x86, occasionally, the removal of a breakpoint (i.e., removal of
the int3 instruction) fails because the text_mutex is taken by another
CPU (mainly due to the static_key mechanism, I think).  The function
kgdb_skipexception catches exceptions from these spurious int3
instructions, bails out of KGDB, and continues execution from the
previous PC address.

However, this led to an endless loop between the int3 instruction and
kgdb_skipexception since the int3 instruction (being still present)
triggered again.  This effectively caused the system to hang.

With this patch, we try to remove the concerned spurious int3
instruction in kgdb_skipexception before continuing execution.  This
may take a few attempts until the concurrent holders of the text_mutex
have released it, but eventually succeeds and the kernel can continue.

Signed-off-by: Florian Rommel <mail@florommel.de>
---
 arch/x86/kernel/kgdb.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
index 64c332151af7..585a7a72af74 100644
--- a/arch/x86/kernel/kgdb.c
+++ b/arch/x86/kernel/kgdb.c
@@ -723,7 +723,31 @@ void kgdb_arch_exit(void)
 int kgdb_skipexception(int exception, struct pt_regs *regs)
 {
 	if (exception == 3 && kgdb_isremovedbreak(regs->ip - 1)) {
+		struct kgdb_bkpt *bpt;
+		int i, error;
+
 		regs->ip -= 1;
+
+		/*
+		 * Try to remove the spurious int3 instruction.
+		 * These int3s can result from failed breakpoint removals
+		 * in kgdb_arch_remove_breakpoint.
+		 */
+		for (bpt = NULL, i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+			if (kgdb_break[i].bpt_addr == regs->ip &&
+			    kgdb_break[i].state == BP_REMOVED &&
+			    (kgdb_break[i].type == BP_BREAKPOINT ||
+			     kgdb_break[i].type == BP_POKE_BREAKPOINT)) {
+				bpt = &kgdb_break[i];
+				break;
+			}
+		}
+		if (!bpt)
+			return 1;
+		error = kgdb_arch_remove_breakpoint(bpt);
+		if (error)
+			pr_err("skipexception: breakpoint remove failed: %lx\n",
+			       bpt->bpt_addr);
 		return 1;
 	}
 	return 0;
-- 
2.46.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
