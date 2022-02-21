Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5364BD8F3
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 21 Feb 2022 11:12:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nM5gC-0006vO-5V
	for lists+kgdb-bugreport@lfdr.de; Mon, 21 Feb 2022 10:12:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tangmeng@uniontech.com>) id 1nM2dq-00085p-2v
 for kgdb-bugreport@lists.sourceforge.net; Mon, 21 Feb 2022 06:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FP5x1u9Oa169m4tpEPx15G30Mio+MvD4qaBLlvek5o8=; b=E+RszeyB/j3lwpj0Gk9j/Dnhcr
 mwkbloHaYTmTV8q/Pa79k4cxtBQY4/rCAxvRX8WwatKeNM38CLWPMsKvkOWBAXAFuxhRImmXxScoI
 FXW7m8lnQflqRWjx9k7RT5ArW1wL7sZ0YsoH/5Ub4G++4ehRQo3Mfwn57nXRPzmROOwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FP5x1u9Oa169m4tpEPx15G30Mio+MvD4qaBLlvek5o8=; b=B
 SjJOCJ6uoY3Obo4vL2NBW87BjKreeTXOpUuOZopl76R0yQQdHlP3Dtc/kUgM1XarQ4qAvmGGf5VKm
 m7qcq+ykFWFEp4yMOCFqTNLOFMtrqOYy4hpPJ9Iyv2dLlbERTbSp7UrxQw4+bC4aLgulflrdyRRvX
 zERTLkp4e6BupRWQ=;
Received: from smtpbg464.qq.com ([59.36.132.32] helo=qq.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nM2de-0003Xr-Bb
 for kgdb-bugreport@lists.sourceforge.net; Mon, 21 Feb 2022 06:57:47 +0000
X-QQ-mid: bizesmtp79t1645424404te6fwesw
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 21 Feb 2022 14:19:58 +0800 (CST)
X-QQ-SSF: 01400000002000B0F000000A0000000
X-QQ-FEAT: hR9GyqeohSjJ8b/qPk34ny37FDJWImGPRvOx7CiNu3SDi/J1JEglKreV1giAO
 DO8xtgMRmohoyPBF3C537Ys3WEBfk6oA6v29etPGuRLwNbEXuajJpL4VS4I63kXOXMehMs7
 vQ8TUXh4vYgwsoz75bgK+Jurhfwwp4nlYZBv23LwBYxaMKqzzV30e6PHk2Op2N4pW6mJ2Wz
 hfr2eBOq8dWMr1+WoY1W7HheQvSKwCcHLqfnKYcp+XM1h9wiwGVOjshARnkFiO4R0P36NkF
 5aOs9K+IiByovORfSgURAaNuFtplWzRjOS0hHCjanRqtqB9feuqrqeUCigEzNRt4MlN2+Yf
 k1NoiHJrCIR3qw52txtSJknNkO3zECzpYjCp4+M
X-QQ-GoodBg: 1
From: tangmeng <tangmeng@uniontech.com>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org
Date: Mon, 21 Feb 2022 14:19:54 +0800
Message-Id: <20220221061954.4822-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In kernel/Makefile has: obj-$(CONFIG_KGDB) += debug/ so
 kernel/debug/Makefile
 don't need this 'obj-$(CONFIG_KGDB) +=', delete it from kernel/debug/Makefile.
 Signed-off-by: tangmeng <tangmeng@uniontech.com> --- kernel/debug/Makefile
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [59.36.132.32 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
X-Headers-End: 1nM2de-0003Xr-Bb
X-Mailman-Approved-At: Mon, 21 Feb 2022 10:12:27 +0000
Subject: [Kgdb-bugreport] [PATCH] kernel/debug: remove unnecessary CONFIG
 options
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 tangmeng <tangmeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

In kernel/Makefile has:
obj-$(CONFIG_KGDB) += debug/

so kernel/debug/Makefile don't need this 'obj-$(CONFIG_KGDB) +=',
delete it from kernel/debug/Makefile.

Signed-off-by: tangmeng <tangmeng@uniontech.com>
---
 kernel/debug/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/Makefile b/kernel/debug/Makefile
index 332ee6c6ec2c..9c49ff7c75f4 100644
--- a/kernel/debug/Makefile
+++ b/kernel/debug/Makefile
@@ -3,5 +3,5 @@
 # Makefile for the linux kernel debugger
 #
 
-obj-$(CONFIG_KGDB) += debug_core.o gdbstub.o
+obj-y += debug_core.o gdbstub.o
 obj-$(CONFIG_KGDB_KDB) += kdb/
-- 
2.20.1





_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
