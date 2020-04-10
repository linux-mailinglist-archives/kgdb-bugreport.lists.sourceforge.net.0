Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5D51A4C32
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 11 Apr 2020 00:46:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jN2PP-0004wk-IE
	for lists+kgdb-bugreport@lfdr.de; Fri, 10 Apr 2020 22:45:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jN2PO-0004wc-2j
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:45:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JjUK3hCgG4ZVP2cWUyMCGx3upUSYjvrftcm9fZ76CII=; b=mYw0WOjvfnfOKV5/iKAknI6snR
 HmEs4U2543UkB2o8SLtpGx+rbZMy15TZyCwNcbWUMGfa3aAQPX/dPx6dbMrqY9TPxruUknphTugpE
 9lXR4GHenUTPpDljeQgch2xPsQDgAL4mxPjXFo5Lj/qvKvdi0CC7FDQC4BQD2m+/5Lc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JjUK3hCgG4ZVP2cWUyMCGx3upUSYjvrftcm9fZ76CII=; b=gL7gJZGKIA6EoLF3V3Gi5Y3HEV
 LjUJuKbKlwVpaC+EW8Oyn74acXnlnQ5rgPvh/BdDVX/YtrDL6WDxlB3CCzgO2JgPYRzhiqPEdxxMn
 bYJ0YcwwkqpcxMy2hZuEGKh0ku6/AFokrpdvM4uiLXG05e0rCL0qjrhOGbtgUsVkzq/A=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jN2PL-00BBby-Sz
 for kgdb-bugreport@lists.sourceforge.net; Fri, 10 Apr 2020 22:45:58 +0000
Received: by mail-pf1-f195.google.com with SMTP id v23so1635645pfm.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 10 Apr 2020 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JjUK3hCgG4ZVP2cWUyMCGx3upUSYjvrftcm9fZ76CII=;
 b=Nyq6OxaN+zvvfmKkmfqed97hvOgJeuG7t2F2hgQMntVcHfYzVmfCZSA0sofUwi4fc2
 MVFsZr6W1J2Au1LTfMzh7i4sXkhJe2l6FDr5qfSZgpI4sZhvz2oOWhjK0554O8NF1ahh
 JmfHga1PW8S9Ow9Y6sfCb2wkM0/FrwWdqxhwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JjUK3hCgG4ZVP2cWUyMCGx3upUSYjvrftcm9fZ76CII=;
 b=Xs0b9EU1KwqsVbJ0otSIfHm6rDzw8nEWBd0uBWAiqcFjnUHGcVRLCijfXhfiYCsFDK
 7jljcIKjZbn4nReExq5fs1AnkxoIrkTDdNLmMnm2Z8d4OZeQF3hSoz9K4PscuImjbPeB
 kD/bWeFIf/vmxXK/tjM75X0s+PdhlHIzFgYzNSxJQk2SMFVt5woWVmK0JiS8uNZqyyjt
 xgI5JM0S/2DoZdZDnyI04iLzgs+S8PHp/bEFj5588yaEg4zGTcQgOXX67BgNgajKPC74
 Qlr6HS/ZG52/3T/L0MIECfuSyjJJkGJQCtfEjbeO+5tQt9yvOwZkhArbEFxZ6agpc7v1
 9M5A==
X-Gm-Message-State: AGi0Pubbbhwp9pjTA/b+wJeSl27Mc3DyBh8fDTuqzsmJ4TBnJqEyR0RH
 RDvqV8fSa7b2MMflRfWMiEHr6jh24sbMbw==
X-Google-Smtp-Source: APiQypI1k7F2ESHdo89rqD3FVQ7JzUVJ9BLRyRi3u53jOxnBFX8vHZpXSD/dycmaKpD8jRimhbe90w==
X-Received: by 2002:a17:902:70c1:: with SMTP id
 l1mr6294862plt.298.1586557106006; 
 Fri, 10 Apr 2020 15:18:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id x2sm2646600pfq.92.2020.04.10.15.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 15:18:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Fri, 10 Apr 2020 15:17:24 -0700
Message-Id: <20200410151632.5.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
In-Reply-To: <20200410221726.36442-1-dianders@chromium.org>
References: <20200410221726.36442-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jN2PL-00BBby-Sz
Subject: [Kgdb-bugreport] [PATCH 5/7] Documentation: kgdboc: Document new
 earlycon_kgdboc parameter
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, hpa@zytor.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, will@kernel.org,
 corbet@lwn.net, agross@kernel.org,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, bp@alien8.de,
 Josh Poimboeuf <jpoimboe@redhat.com>, tglx@linutronix.de, mingo@redhat.com,
 Juergen Gross <jgross@suse.com>, Oliver Neukum <oneukum@suse.com>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The recent patch ("kgdboc: Add earlycon_kgdboc to support early kgdb
using boot consoles") adds a new kernel command line parameter.
Document it.

Note that the patch adding the feature does some comparing/contrasting
of "earlycon_kgdboc" vs. the existing "ekgdboc".  See that patch for
more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
and just makes "kgdboc" do its normal initialization early (only works
if your tty driver is already ready).  The new "earlycon_kgdboc" works
in combination with "kgdboc" and is backed by boot consoles.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../admin-guide/kernel-parameters.txt         | 20 +++++++++++++++++++
 Documentation/dev-tools/kgdb.rst              | 14 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c07815d230bc..37dc2db13743 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1124,6 +1124,22 @@
 			address must be provided, and the serial port must
 			already be setup and configured.
 
+	earlycon_kgdboc=	[KGDB,HW]
+			If the boot console provides the ability to read
+			characters and can work in polling mode, you can use
+			this parameter to tell kgdb to use it as a backend
+			until the normal console is registered. Intended to
+			be used together with the kgdboc parameter which
+			specifies the normal console to transition to.
+
+			The the name of the early console should be specified
+			as the value of this parameter. Note that the name of
+			the early console might be different than the tty
+			name passed to kgdboc. If only one boot console with
+			a read() function is enabled it's OK to leave the
+			value blank and the first boot console that implements
+			read() will be picked.
+
 	earlyprintk=	[X86,SH,ARM,M68k,S390]
 			earlyprintk=vga
 			earlyprintk=sclp
@@ -1182,6 +1198,10 @@
 			This is designed to be used in conjunction with
 			the boot argument: earlyprintk=vga
 
+			This parameter works in place of the kgdboc parameter
+			but can only be used if the backing tty is available
+			very early in the boot process.
+
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/dev-tools/kgdb.rst
index d38be58f872a..c0b321403d9a 100644
--- a/Documentation/dev-tools/kgdb.rst
+++ b/Documentation/dev-tools/kgdb.rst
@@ -274,6 +274,20 @@ don't like this are to hack gdb to send the :kbd:`SysRq-G` for you as well as
 on the initial connect, or to use a debugger proxy that allows an
 unmodified gdb to do the debugging.
 
+Kernel parameter: ``earlycon_kgdboc``
+-------------------------------------
+
+If you specify the kernel parameter ``earlycon_kgdboc`` and your serial
+driver registers a boot console that supports polling (doesn't need
+interrupts and implements a nonblocking read() function) kgdb will attempt
+to work using the boot console until it can transition to the regular
+tty driver specified by the ``kgdboc`` parameter.
+
+Normally there is only one boot console (especially that implements the
+read() function) so just adding ``earlycon_kgdboc`` on its own is
+sufficient to make this work.  If you have more than one boot console you
+can add the boot console's name to differentiate.
+
 Kernel parameter: ``kgdbwait``
 ------------------------------
 
-- 
2.26.0.110.g2183baf09c-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
