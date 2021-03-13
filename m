Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC533B0C2
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 15 Mar 2021 12:14:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lLlBE-0004e7-GO
	for lists+kgdb-bugreport@lfdr.de; Mon, 15 Mar 2021 11:14:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shubhankarvk@gmail.com>) id 1lLCHI-00031E-8E
 for kgdb-bugreport@lists.sourceforge.net; Sat, 13 Mar 2021 21:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lnk3PySiNNRNpdtAa9FMD7rzrJM24IssSyMpOzucki0=; b=DuM6I8Ycgb8pHKEYDx2I3EH89W
 5/pISn61aPeXAXKeCVgMFnOnANe6vQS+X6X2gPKD34YNSNIUP5g9hbc+lGpW+EOaweLaCymEx05Z8
 9YzfsQ2Rz2RSC/kE1Yu7rkKRS027LUCzsnehNhaHNjERTV+4W3WzFmk53Lts5MonOBdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lnk3PySiNNRNpdtAa9FMD7rzrJM24IssSyMpOzucki0=; b=h
 3Q6XJXV73R92uzbLEhwsW1S3WX2JYY9fKPNt1FX6n+FtSmsjYvT58atfJf/B3XhNsXk8q7TWy6nis
 k4jI5E+K1f0LpLZeAT8Q/OR27E0/zAgbu9BR5NfaGjn0CoP7PBAOuFteyAQv3Q50IPRE3jbA3DB/I
 0m6yIx2cHQYEhDto=;
Received: from mail-pj1-f48.google.com ([209.85.216.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lLCH8-00BdEF-Sz
 for kgdb-bugreport@lists.sourceforge.net; Sat, 13 Mar 2021 21:58:32 +0000
Received: by mail-pj1-f48.google.com with SMTP id t18so6886066pjs.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 13 Mar 2021 13:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=lnk3PySiNNRNpdtAa9FMD7rzrJM24IssSyMpOzucki0=;
 b=TB3QGkEfYmt9sg9saceMJPJ07KHVMuJs6heKAUODzKBpM+IqmmmLX+kWeG1XBdDEym
 mhXq1SLQdeqSEt1X9SyTvJWYCkyHTDq6Wn0QUGBtlHyQxue3peSJGA+Aq13fci7GBSvr
 vnc7mlFbnzrAGhkQnmMMJAbI48LfA/uGoxXg3ZwT8Ir8eBDri/IQcV5LBv6E79KxVgwQ
 +tK0cGzcWzCuN+qa3OXHkVGMnsWPmwrPQna6gvTxK9hoBeWdeTQIMO1NtLsX9LB51sHY
 j9uWGJGQOqiJH0PCI6bXv/FokG4iv0B28+ytwg9vEQq+ivOTC6wUBbc08WVErKCGfTZL
 d/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=lnk3PySiNNRNpdtAa9FMD7rzrJM24IssSyMpOzucki0=;
 b=HKuSLD+uONQ+yRgLatX4ycXO/RX1aJyaYcFcC3hiU6S0EQU+GZxrZbYxsL9YhKwCAe
 938HrfXBsM3RgOup0Ubbz8SsnLviOOiHnPW9GOdmVjH7khIMWKLSRHRwlJDm7j+aNEP4
 SO8ielQ77gmYtjkEHP2a+QwdwraOWXnlzUUSdUkriqfF1/TKnY5vkHfKEbUpLs0v2GZ7
 c+uujMHJGOJmxj37hO3JmD+SnyDJ6c2Y3qN+K0nVSCtpGaaYBOxdSoEA/PKidtkyTHVN
 WW8zKn2Bq9RJ1kh+oSawGOBhIVwrz0U8RanG6AylREFIbW3pWIqXcy+2lZegJFm8jgoe
 OUlw==
X-Gm-Message-State: AOAM530gFy8LZ73LcBAtJgxpNKayfUktunBLqvfEvydx2z5AJfJVwdXo
 l3bodXiVedFTA0qBNMmzuB8=
X-Google-Smtp-Source: ABdhPJxQHWm9NJRx4jcNAcEO1d4hLIzvLSSizFonvjqCRXggBiCFs/1LqY879k2L4eunpE0PK1F3Sg==
X-Received: by 2002:a17:902:d30c:b029:e3:f95:6da5 with SMTP id
 b12-20020a170902d30cb02900e30f956da5mr4813972plc.6.1615672697239; 
 Sat, 13 Mar 2021 13:58:17 -0800 (PST)
Received: from localhost ([122.179.34.200])
 by smtp.gmail.com with ESMTPSA id q14sm2288747pff.94.2021.03.13.13.58.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 13 Mar 2021 13:58:16 -0800 (PST)
Date: Sun, 14 Mar 2021 03:28:08 +0530
From: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
To: jason.wessel@windriver.com
Message-ID: <20210313215808.dt7uvt2suwq4z4x3@kewl-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20171215
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (shubhankarvk[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.48 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lLCH8-00BdEF-Sz
X-Mailman-Approved-At: Mon, 15 Mar 2021 11:14:34 +0000
Subject: [Kgdb-bugreport] [PATCH 1/2] drivers: misc: kgdbts.c: Fix
 declaration warning.
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
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, bkkarthik@pesu.pes.edu,
 linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

A new line has been added after declaration. This is done to
maintain code uniformity.

Signed-off-by: Shubhankar Kuranagatti <shubhankarvk@gmail.com>
---
 drivers/misc/kgdbts.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
index 945701bce553..3ee5acc1c391 100644
--- a/drivers/misc/kgdbts.c
+++ b/drivers/misc/kgdbts.c
@@ -474,6 +474,7 @@ static int emul_sstep_put(char *put_str, char *arg)
 {
 	if (!arch_needs_sstep_emulation) {
 		char *ptr = &put_str[11];
+
 		if (put_str[1] != 'T' || put_str[2] != '0')
 			return 1;
 		kgdb_hex2long(&ptr, &sstep_thread_id);
@@ -502,6 +503,7 @@ static int emul_sstep_put(char *put_str, char *arg)
 			return 1;
 		} else {
 			char *ptr = &put_str[11];
+
 			kgdb_hex2long(&ptr, &sstep_thread_id);
 		}
 		break;
@@ -740,6 +742,7 @@ static int validate_simple_test(char *put_str)
 static int run_simple_test(int is_get_char, int chr)
 {
 	int ret = 0;
+
 	if (is_get_char) {
 		/* Send an ACK on the get if a prior put completed and set the			* send ack variable
--
2.17.1



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
