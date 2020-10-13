Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAA28CCDD
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 13 Oct 2020 13:55:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kSItX-0001eL-6R
	for lists+kgdb-bugreport@lfdr.de; Tue, 13 Oct 2020 11:55:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab@kernel.org>) id 1kSItU-0001dp-Td
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Oct 2020 11:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MzRKF7hhSXqEYeVOUzMr0FrhbgwePIjIBZr6f+9WWcs=; b=QyerBvCuxdL0oYP9IUDU6N8zjH
 UlsIYS/NL5wO81yS4GckAVbTh1SLbE0REIH2+Rz4oJzDmIt4Iz0kMyCCAugRrV2jmDyBhYWW7H5yh
 jmKML1G7FZB+GUn6qXH98QI8x4bVARMjYoO3+y30jgvFUh4XJlS8m4HAnik+QYwRdaCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MzRKF7hhSXqEYeVOUzMr0FrhbgwePIjIBZr6f+9WWcs=; b=Ztv+JY//328MZWVin+fYxOL44L
 UeF9upmERhz6GFZf4ah1BcGcoTZijhmtrYObGcp+peExJ7vrieeQh92LPwS6G1tN+N76ey42kwFk0
 MQcaMHbx83iPGXbEMKY+EDrv36gLlr1bo2FO10Qx1gqtST6TfvATLvPTE5/BXwX+IwAw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kSItP-00DPwC-P0
 for kgdb-bugreport@lists.sourceforge.net; Tue, 13 Oct 2020 11:55:04 +0000
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E401A2240C;
 Tue, 13 Oct 2020 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=2L6tpoHQxyeOwadIQQN4Im2A93Tx/4SXMLjoXbv8Smc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i6Qu06NZNWoufV989krWJrvsECI2OvRp9G/FGoWsdKf5rIVyMsg2DCyvHdNOb/Hin
 elSXcE4Sl/FYmRjTQHuS93J4Z/gGCqqVneweyMTzpOW9SfWPeIIv51sWeye/uKFZya
 pgfU6HZSAFYxV3Z6hXQr3LC2UpTl/NQQaJyCrkrY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt4-006CV3-RP; Tue, 13 Oct 2020 13:54:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue, 13 Oct 2020 13:53:56 +0200
Message-Id: <0c56e8cfd793c0ac5810a12536d93ad6e223eca4.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kSItP-00DPwC-P0
Subject: [Kgdb-bugreport] [PATCH v6 41/80] docs: kgdb.rst: fix :c:type:
 usages
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Which Sphinx 3, :c:type:  can't be used anymore for structs,
as this should be used only for typedefs.

Rely on automarkup.py for struct references.

This file has an special case, though: it uses the tag also
to point to an array. Let's use, instead, :c:expr: for such
purpose, as it should do the right thing.

This should fix this warning:

	./Documentation/dev-tools/kgdb.rst:875: WARNING: Unparseable C cross-reference: 'kdb_poll_funcs[]'
	Invalid C declaration: Expected end of definition. [error at 14]
	  kdb_poll_funcs[]
	  --------------^

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/dev-tools/kgdb.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index c908ef4d3f04..77b688e6a254 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -726,7 +726,7 @@ The kernel debugger is organized into a number of components:
    -  contains an arch-specific trap catcher which invokes
       kgdb_handle_exception() to start kgdb about doing its work
 
-   -  translation to and from gdb specific packet format to :c:type:`pt_regs`
+   -  translation to and from gdb specific packet format to struct pt_regs
 
    -  Registration and unregistration of architecture specific trap
       hooks
@@ -846,7 +846,7 @@ invokes a callback in the serial core which in turn uses the callback in
 the UART driver.
 
 When using kgdboc with a UART, the UART driver must implement two
-callbacks in the :c:type:`struct uart_ops <uart_ops>`.
+callbacks in the struct uart_ops.
 Example from ``drivers/8250.c``::
 
 
@@ -875,7 +875,7 @@ kernel when ``CONFIG_KDB_KEYBOARD=y`` is set in the kernel configuration.
 The core polled keyboard driver for PS/2 type keyboards is in
 ``drivers/char/kdb_keyboard.c``. This driver is hooked into the debug core
 when kgdboc populates the callback in the array called
-:c:type:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
+:c:expr:`kdb_poll_funcs[]`. The kdb_get_kbd_char() is the top-level
 function which polls hardware for single character input.
 
 kgdboc and kms
-- 
2.26.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
