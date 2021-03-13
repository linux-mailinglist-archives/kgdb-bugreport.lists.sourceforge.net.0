Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE28C33B0C3
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 15 Mar 2021 12:14:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lLlBE-0004eG-Kt
	for lists+kgdb-bugreport@lfdr.de; Mon, 15 Mar 2021 11:14:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shubhankarvk@gmail.com>) id 1lLCIZ-000346-6s
 for kgdb-bugreport@lists.sourceforge.net; Sat, 13 Mar 2021 21:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O7+2eZP2W86H2DLexjazqWbJPqedwA+wictLUHpSxcs=; b=jfAnFCq1tXcgO3NG8qwD5V2v2f
 LAnCKIXdJjgHHF43zURaDu703wDBv3CYaDpdP1cfzYWM+cOMm45xT7xOjBkIWL9mdy8U/Af9ke59M
 4aJwkhrbze21573ByEOloMXmGn0/m6B12wZtOKH6mc5WPlDNXCca8fSjNyWm47BK7M5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O7+2eZP2W86H2DLexjazqWbJPqedwA+wictLUHpSxcs=; b=A
 r4hREz66EAhPVXfYpHaY2+LVWDFSSf1FDVxF1ujCssGOYDEv+KtE3uvTcrYwR34Uin0TAwpupfk8w
 2whY+62LPbcCYABpnLTIo5JfdCEEE6DtIsUtnRVwt42iGn9X0YUcE+f10KcXHEavQyPvSpK8tecZE
 24/oHArtbesTkhDo=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lLCIT-0008Sj-VH
 for kgdb-bugreport@lists.sourceforge.net; Sat, 13 Mar 2021 21:59:50 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso12824081pjb.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 13 Mar 2021 13:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=O7+2eZP2W86H2DLexjazqWbJPqedwA+wictLUHpSxcs=;
 b=qVfJMzeOrAtnNbLOwEyjkoOr0oLuRHf+pTiHwYdIIHsbZSj1lVRQcgApQJTlYj/Iuo
 JvggtYXkSDXnUUNrz/nNvpOrGkg8Ap52BA8FQfqMjelJePtzIw5pi2/9V3Kg34smibP4
 LsIQL+cuakP7ASfmA9kCYx08XnlSl1zPYgUI3dWAgZezKPhTsDg9F1ZYp+Ll4aU/qeAY
 dyu5tJHnAmgWQROGAbhvMjNqy1Gs+xyXaa+OkeZ+vKK7N2S0IUpaA1TqnrlIc8QOvL2V
 6p+PQVzDxwg3jvu6m4fDKh8pdshNK5CmQnt3hgzBWuTZk3mm+Paj68WRP8E9W/xIfCoE
 nukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=O7+2eZP2W86H2DLexjazqWbJPqedwA+wictLUHpSxcs=;
 b=kjRZbr3n8/Y2Nwp8zvB2l/6nFJ9sZgFFr0sNKyVM6lkJGMxz2GL74WcxLgptKjUk8O
 3d1PnYYLmgDuZ0sb3EjeZDsqay4OgmtcHrQxHdynNQOiDh8DxaxtB5D1tpybVX/yt1Ql
 V0YCAZRerfWxQKOYp0ECjGPoQ0U+5kCXQXluP+gyI4zrdiyF/15PFc7I6dgKyCihISMJ
 /nPbFEjOD5a5XNruPtxk1I2t68Xq8SChCV7+0D7UWLe20DHVKmP3IRISJ03UNEmJeEeK
 SxblcWPyZM4rzh4i6pGV1tqduKpTXnyfwccud/9gS4ip45HU4itp1F30eAm8JdP011UC
 TsEQ==
X-Gm-Message-State: AOAM533RZX89USkM6RIjgIwb7OJAbfWW8M1rDbRradmSVGrr8jDx359K
 mowd4qBTkU1BlnAdF32JgIs=
X-Google-Smtp-Source: ABdhPJybchg4iBw3bSpMm4rz2sxmlLG5WQ6fRzk+Nk8gMiew3PYNZhNhekQu7qk2pyNE5xLDadhJfA==
X-Received: by 2002:a17:90b:358:: with SMTP id
 fh24mr5392777pjb.109.1615672780356; 
 Sat, 13 Mar 2021 13:59:40 -0800 (PST)
Received: from localhost ([122.179.34.200])
 by smtp.gmail.com with ESMTPSA id c22sm8642891pfl.169.2021.03.13.13.59.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 13 Mar 2021 13:59:39 -0800 (PST)
Date: Sun, 14 Mar 2021 03:29:37 +0530
From: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To: jason.wessel@windriver.com
Message-ID: <20210313215937.iiw22mj5jxvd7sef@kewl-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (shubhankarvk[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lLCIT-0008Sj-VH
X-Mailman-Approved-At: Mon, 15 Mar 2021 11:14:34 +0000
Subject: [Kgdb-bugreport] [PATCH 2/2] drivers: misc: kgdbts.c: Fix
 indentation warning.
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
Cc: daniel.thompson@linaro.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 bkkarthik@pesu.pes.edu, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

An extra space has been removed before tab. This is to maintain
code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/misc/kgdbts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 3ee5acc1c391..e6e7c5144ab3 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -41,10 +41,10 @@
  *
  * To invoke the kgdb test suite from boot you use a kernel start
  * argument as follows:
- * 	kgdbts=V1 kgdbwait
+ *	kgdbts=V1 kgdbwait
  * Or if you wanted to perform the NMI test for 6 seconds and kernel_clone
  * test for 100 forks, you could use:
- * 	kgdbts=V1N6F100 kgdbwait
+ *	kgdbts=V1N6F100 kgdbwait
  *
  * The test suite can also be invoked at run time with:
  *	echo kgdbts=V1N6F100 > /sys/module/kgdbts/parameters/kgdbts
--
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
