Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14986916D33
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Jun 2024 17:35:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sM8Co-0003tA-LG
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 25 Jun 2024 15:35:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ton1ght@pm.me>) id 1sM6Ch-000893-TN
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Jun 2024 13:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:From:
 To:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBnVNv6J5D1vMMTHFNW6bYrEZj2/q934A4KMGyxmF5s=; b=aoNzSpzEIilLcMlj/er8Cu29Pa
 qwRXYQJU+pVrNS7mVvkIrB6Gq3SV+zvwxnhrd6sPmPDS0isslIdtWUP4SwPlYH4cr9Pg6FaR0KbTo
 Oe89P5rJ+pxhJQJG0/0BZAJCQ4315IodED2iiJOp21klN0Nq1wKoHRD2zpCUDj5RtQOs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lBnVNv6J5D1vMMTHFNW6bYrEZj2/q934A4KMGyxmF5s=; b=T
 2hWJ2LIzzCcAESQ81VzbW2q5I4P8mueEQnsadrI571y/9kb/4IboZXk4tscAM52dAUUsOrU58kG8F
 plYPBPW5/eNbA4Bie6Ja1CTxCOCRi/GhBtXlLazZczdVoM5FO2yLUaNgxYf+F+q6J2Cxb0omKTLEs
 hVcwNMpxDX9rv1Ic=;
Received: from mail-41103.protonmail.ch ([185.70.41.103])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM6Ch-0006TX-K5 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 25 Jun 2024 13:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1719322017; x=1719581217;
 bh=lBnVNv6J5D1vMMTHFNW6bYrEZj2/q934A4KMGyxmF5s=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=YoRklU++4eqemXKgT1xLxdyNF2vcq+usoKLURDvjVoOehJfwjR+dsx89Z1Wg7ypSs
 Qd+LMvaM7Fj0mnL2b8wnlXmwrXonRUhrc1FKyeacD1WNFVD725zGsQVu6llms9hIDr
 vjtwiNuQvTqUhgVDKuTqVmK3Pn60tN3CxECIIy5iewT7BYlpFoeMl9bHdh2QxlaF+k
 gNRg3a91UlvqW5vBd106X6rziKiNianLW/LtbBSdoBW3jjDyQZ/m+oTC5HohyGw8XV
 F3+YC14fs30W61a/4PF9pbpGDYY1q0LF2yBmllwJl2O6e7UqulDFtny/q2StITwpSV
 hOTezRhHIPBfg==
Date: Tue, 25 Jun 2024 13:26:52 +0000
To: "kgdb-bugreport@lists.sourceforge.net"
 <kgdb-bugreport@lists.sourceforge.net>
Message-ID: <nP_t7IJFUxpyaZUd9_qep2AINZg3uSecl0oFGPa3oluaNrG7DCWvwXFPOf0i8aqLbePrj_QKHK4jUjFzbxVTz15etycERvg8HTPGgCpa2UY=@pm.me>
Feedback-ID: 36596143:user:proton
X-Pm-Message-ID: 3f71d0a6b0cba7f77c3b95f7f5fe79cff9109781
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 I am sorry to bother you but I am very frustrated because
 i cannot get a cross debugging setup working (x86 Linux host and ARM Linux
 target). The setup works "a little bit", but as soon as i encounter [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: reddit.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [185.70.41.103 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.70.41.103 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [185.70.41.103 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 HTML_MESSAGE           BODY: HTML included in message
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sM6Ch-0006TX-K5
X-Mailman-Approved-At: Tue, 25 Jun 2024 15:35:38 +0000
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Kgdb-bugreport] KGDB and ARM
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
From: ton1ght via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: ton1ght <ton1ght@pm.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello,

I am sorry to bother you but I am very frustrated because i cannot get a cross debugging setup working (x86 Linux host and ARM Linux target). The setup works "a little bit", but as soon as i encounter a specific instruction the board just hangs and gets unresponsive. Do you have an idea what is wrong with my setup?

I have a detailed description of the problem right here:
https://pastebin.com/xLEZmYHk
or here (formatted):https://www.reddit.com/r/gdb/comments/1djkj80/kgdb_for_arm/

Thanks a lot!
_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
