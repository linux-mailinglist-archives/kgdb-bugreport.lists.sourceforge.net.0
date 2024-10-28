Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 733F69B3A4B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 20:17:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5VEp-0004Gv-3N
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 19:17:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t5VEm-0004Gn-Ut
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gzn3DEUpI1y8Dh+Fu1feIM8b7ZMu76WvwUcmi43JeaU=; b=NP+h4q3vaRF7XjxqyYuR0L3PJJ
 gBWOhtqy9sPOfbD7VVFnoLitsTgzzOTAtqVVezPh27wY0kFYzRhGU7/1zc9nhpyfJymR4enm/cNOF
 yapilr/pBPlm2bqkNuWW5eN1nXi5udPd0CnSp5jfZu0IUtkU6i+ie8+ZW5QT5WyPOntc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gzn3DEUpI1y8Dh+Fu1feIM8b7ZMu76WvwUcmi43JeaU=; b=E
 J1fBAXgaCs9tbFmOaNiZv3wN1qAjm7D0NY0gRn0yO1SDtUoxGj1xvm+scUXf2d/FrYb9cHVXrr8Uq
 2wEt0m1Hxl3Ll22TL+nHFrGylIasvobZfjYHYfliq5kIdQoRwI9YRs5Rz+7NBD1qQObPQSxkb5PxU
 ssi3tVGiiqR7D4XE=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5VEl-00030q-FN for kgdb-bugreport@lists.sourceforge.net;
 Mon, 28 Oct 2024 19:17:12 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 9728D177105; Mon, 28 Oct 2024 19:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1730143020; bh=y+6RmVA7Vuc+6PEZN2k36qLk2mZfoNZZoCo3OE7qqWg=;
 h=Date:From:To:Cc:Subject:From;
 b=iY1EWanW1N71ET9sPPg78zaRQD0Fwm4YdA7vWsLDwsivNhXtaz1MhUiPOMUiGeglJ
 JuDqy6lVAyzzlWu6EZWQWuEP1SYEAzxlDD2qvv1I4Nw4i87gKr91HOKNP5Qm7t5dFF
 KVee8b7bBomGF0j67UhriHI+kUfNmWzTSh4C14cT0z2fV/VZHSVpB3O2PDrgQTGBe3
 2AzdTXeip/wy7/Pk6cZgwEmIf+Zudw5DmQ0racWGcvGYNCgFzEMXXD+xYih6Se2YG8
 +rsFtBkql9y5SGxMlP0X+anBrPOIdADK5Jwu25rWlj43+AjExvHNzLb0BjChyNyktm
 lzrg4kebzRqDA==
Date: Mon, 28 Oct 2024 19:17:00 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241028191700.GA918263@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The simple_str* family of functions perform no error checking
 in scenarios where the input value overflows the intended output variable.
 This results in these function successfully returning even when [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1t5VEl-00030q-FN
Subject: [Kgdb-bugreport] [PATCH v4 0/3] Replace the use of simple_strtol/ul
 functions with kstrto
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
Cc: daniel.thompson@linaro.org, rostedt@goodmis.org,
 linux-kernel@vger.kernel.org, mhiramat@kernel.org, jason.wessel@windriver.com,
 yuran.pereira@hotmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The simple_str* family of functions perform no error checking in
scenarios where the input value overflows the intended output variable.
This results in these function successfully returning even when the
output does not match the input string.

Or as it was mentioned [1], "...simple_strtol(), simple_strtoll(),
simple_strtoul(), and simple_strtoull() functions explicitly ignore
overflows, which may lead to unexpected results in callers."
Hence, the use of those functions is discouraged.

This patch series replaces uses of the simple_strto* series of function
with the safer  kstrto* alternatives.

  
[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Yuran Pereira (2):
  kdb: Replace the use of simple_strto with safer kstrto in kdb_main
  trace: kdb: Replace simple_strtoul with kstrtoul in kdb_ftdump
Nir Lichtman (1):
  kdb: Remove fallback interpretation of arbitrary numbers as hex

This patch is originally based upon
https://lore.kernel.org/all/GV1PR10MB65635561FB160078C3744B5FE8B4A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM/

Since the original thread was left with a review and the comments have not been addressed,
decided to continue the minor work left to move this patch forward.

v2:
- Styling fixes
- Fix an invalid conversion to unsigned int instead of signed as it was supposed to be
- Fix one of the conversions to return an error in case of failure, instead of silently falling back to a default value
- Add Douglas's suggestion for removing the hex interpretation fallback
v3: 
- Split to 3 parts instead of 2 (in which the 3rd part now contains the hex interpretation fix)
- Fix the patch series to properly reference the cover
- Fix credit tags
v4:
- Fix regression between v2 to v3 in which I accidentaly
reverted an improper unsigned/signed conversion
- Fix nit of spacing in if condition parens split into multiple lines


 kernel/debug/kdb/kdb_main.c | 69 +++++++++--------------------------
 kernel/trace/trace_kdb.c    | 15 +++-----
 2 files changed, 23 insertions(+), 61 deletions(-)
--
2.39.2


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
