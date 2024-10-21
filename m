Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A88769B2F01
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 28 Oct 2024 12:36:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1t5O2Y-0007dY-Ac
	for lists+kgdb-bugreport@lfdr.de;
	Mon, 28 Oct 2024 11:36:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nir@lichtman.org>) id 1t2zhZ-0000VQ-HG
 for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Oct 2024 21:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6EzJDI0ItoirrgXCD2CaYSF+W3hiAV4WvVAf9NwnDMs=; b=R3vu1jCdL8b1ce8cECzg2ubU88
 H9z6Y2NA84Ggk7PE6oRkSq1UexPDDRffnx4hLKUVaGY/SRCd1l2jdchtjh19PFJOD21BVE1ifwuk9
 q+oZOgiIFmwyXiqvEGtVxZeSHnjZGKBx39tu0UYX88lerWIz5DuEXHoq/HReR3cOvxGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6EzJDI0ItoirrgXCD2CaYSF+W3hiAV4WvVAf9NwnDMs=; b=I
 5bhW2wQyGu+u1dNcRMI+/u4UtYG62uUV8FQEUZ3mdXQtFWFdaUqo4oPB2BcKDhECFZEdIi6KPKg+a
 ontNR4lrmOQNeSCIUJK8/jzPODZynvtMX2FXs6FDQL3kjN/y98jqqgyTT3cEAkk85IB7zngwfmatJ
 7ON8D18JNIcCrPng=;
Received: from lichtman.org ([149.28.33.109])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2zhY-0007gv-Rs for kgdb-bugreport@lists.sourceforge.net;
 Mon, 21 Oct 2024 21:12:33 +0000
Received: by lichtman.org (Postfix, from userid 1000)
 id 0518D177106; Mon, 21 Oct 2024 21:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
 t=1729545142; bh=KuPztDv7ggupu/upOVkA2KT/eVBKur7UN2wM9Xt5FR8=;
 h=Date:From:To:Cc:Subject:From;
 b=p7j9LCjx19f77YziYjAACed145az7xKhhiwrXnMgilK8uXPRcZ6xIEbYiIDFZhlOk
 k/FCgID6OwNtRdk25hKMFOgldU/UG84ouxXovrSrnLkyw0cmgnNMV5/u0qjOwAaUmb
 LYkMPDbq765uDy8UOmEllL9RAalKB5+qGOjN2z2AqwlYQkpj3Z6K2bqVsH4CcSXbij
 axHwYUb3UGOLr+WSZh0gP1OO/vMVIop2DWPC3Iy2l7Jl3zciiso3i182g0xbZlCprX
 hPd8QjHuRyHfT9ghb+axWbA31oeKuqcdghKIJaouWGXTM/ceJcwcHTWvbQxFCJkTe2
 OeCZWsgcN4QGA==
Date: Mon, 21 Oct 2024 21:12:21 +0000
From: Nir Lichtman <nir@lichtman.org>
To: kgdb-bugreport@lists.sourceforge.net,
	linux-trace-kernel@vger.kernel.org
Message-ID: <20241021211221.GA835676@lichtman.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t2zhY-0007gv-Rs
X-Mailman-Approved-At: Mon, 28 Oct 2024 11:35:55 +0000
Subject: [Kgdb-bugreport] [PATCH v2 0/2] Replace the use of simple_strtol/ul
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

v2: Nir Lichtman (2): Removed confusing support for hex number inputs with no preceding "0x", and other CR fixes

 kernel/debug/kdb/kdb_main.c | 69 +++++++++--------------------------
 kernel/trace/trace_kdb.c    | 15 +++-----                             2 files changed, 23 insertions(+), 61 deletions(-)


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
