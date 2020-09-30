Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE727EDCC
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 30 Sep 2020 17:49:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1kNeMb-0002C4-TX
	for lists+kgdb-bugreport@lfdr.de; Wed, 30 Sep 2020 15:49:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <mchehab@kernel.org>) id 1kNc73-0001x6-39
 for kgdb-bugreport@lists.sourceforge.net; Wed, 30 Sep 2020 13:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/IgHzWn4nSg8DVxkZTV4WlWg3ylAgKf9MyZjL4YTEj4=; b=O29MOQpOLvRquxFr3pjWcjphal
 gW1DBSC8RLmoB6e+JPADPghPzJRIKAkOehhn77vu2Ydu1TqEdMtFX2aY+T95gYjPN342hzoEC332J
 e7JRxx+TvK/T2JF3lp/qR/HYIbvNVB/jIjSz9USGp+NfEoK2njnL/PswtoCXYnEQMGG0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/IgHzWn4nSg8DVxkZTV4WlWg3ylAgKf9MyZjL4YTEj4=; b=Q0y6dD0zCftbZ1P9D9DWmv5LhM
 pJOYa/uJupNSdczToh9NUDrKX0PKz3umPS4nmS0AOE9GOGED4owWBnnmDUrPYpltRet7KhM9fc5R0
 LOBTs/1kgcGQEaaPLijboygsZP7g6jS9RdhE2fnIjc9Br6DFKGEewR3MnINKWyTW9R7Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kNc6x-00EP3Y-Og
 for kgdb-bugreport@lists.sourceforge.net; Wed, 30 Sep 2020 13:25:41 +0000
Received: from mail.kernel.org (unknown [95.90.213.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 685BC23A5B;
 Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601472321;
 bh=CX3rlxdQVc3k6PHOkJt8dLdN+qjZ7dGnsrqnBqtVq9E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tXZ0JlA+5l6WXjxT0rX5uKx812jdRwpNLqli5zLUc6w+2rvIuHuQKbpJGJmUqqeFo
 eYu4Dvu8cB+SAvXr9gS/kT6kN99NW4LWsouoeDTXWTtFaM76Sbisg/C5YK7Kbj/5bc
 kPDdT8qSKpWUfcbTJHZly2lXTiYnGI5oJMeHXZ84=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kNc6h-001XKl-IO; Wed, 30 Sep 2020 15:25:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 30 Sep 2020 15:25:04 +0200
Message-Id: <556f72684846c3cc30eb2f0a1e064183d4e1bdc9.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: automarkup.py]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kNc6x-00EP3Y-Og
X-Mailman-Approved-At: Wed, 30 Sep 2020 15:49:52 +0000
Subject: [Kgdb-bugreport] [PATCH v4 41/52] docs: kgdb.rst: fix :c:type:
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
