Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 829761C9BBA
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  7 May 2020 22:09:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jWmpg-0003r2-AZ
	for lists+kgdb-bugreport@lfdr.de; Thu, 07 May 2020 20:09:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1jWmpe-0003qe-Oo
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W1XDP2s0snxdLkMZdyukbleJr+uJ2UqLD4Yvp7W+lko=; b=Fob6aPgSu3+TqFPKdgEgtac458
 rWMCwjUkMFjHbEAUDaWkEGxTnopp2BETPY8o32FS6h5kOT0WsRPTFNP7CV6qd1pUcEV1mevuDHy98
 qU0jZ1F+fGfgbdk8Awg0mSUBX1YSNXKrCzXHwi4HYLS9KII+1c48l8aV22fOR3aI7l4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W1XDP2s0snxdLkMZdyukbleJr+uJ2UqLD4Yvp7W+lko=; b=jqpM2Y5a65YyztCOj1ns8ACdit
 DohSERhWSud2+CcJA5KHvGukDnqo39xsjHwvH3j+/UBr1BT+kqp6zY6zJ1ENso+SWUauu4rMEx9q7
 gBs7/bdMJgQliY0Nq05vHiRt//ua2XYg6RxsIyQqd2UheEN6TekmdEC0al5glaC7l7H8=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWmpd-000hUz-JU
 for kgdb-bugreport@lists.sourceforge.net; Thu, 07 May 2020 20:09:22 +0000
Received: by mail-pf1-f195.google.com with SMTP id 145so3520365pfw.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 07 May 2020 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1XDP2s0snxdLkMZdyukbleJr+uJ2UqLD4Yvp7W+lko=;
 b=ReH1KmW6+/YuI4vEH69rEwtrRWO5C8B9NVFXhM9HjZxD7wtQrMTH9qKyhAIpVmoOsm
 pJWravX1nnZSvRVcjDXlPsYk8CGgbnSgs/U+QzZhCnbMIq77X8tjlApJvXfDgzPLnxpC
 dI+uHqhKsxVPzpFQqLvMF+bqXAiQAAz1PumIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1XDP2s0snxdLkMZdyukbleJr+uJ2UqLD4Yvp7W+lko=;
 b=LSMN+N6uXbKC+szfyzAzpQeITaai5BoOWavh/SOdN8MQZDnoq2o0mNW/ZuYHaEZZ5N
 72XlYgBLyjN9dMhHtz8sORdShXcO58sMS2Zt1AOO3KBSBbZfsmMWWaJAX/ju7yJe1mdU
 4G1pAxYh4oSVECSR6GiGkPEPyR66VS+saha3OJkDeXrLEQlnjNlKFvaUqQHnA1sTE+kN
 f1v9KNIM37nfuLN+Tj+JNRi/03A29GfL28rVCsXAXcAYCVX1C2wbNKRxMC/YCTG763kJ
 N0suLgMp8DA+yU75qCZ5teA6zb53AV5BQwZfx2PpCTBlPhNB6Wjc1ZIw7Y1mmy2q58GG
 kxuw==
X-Gm-Message-State: AGi0PuYrSCCKo6dUB79dZ8FA33mZr57oX2A4HFYocXb/0BVwfM8P8A32
 szZtMnNMwOxqAfoUSzHkklhImA==
X-Google-Smtp-Source: APiQypKgAbnAivOMtSnMHwbQ3TDXgQaQ6YOXhF935haHfa4/tcGU8O7//3m/KM1t6hWHwzOPWSjJqg==
X-Received: by 2002:a63:585c:: with SMTP id i28mr12849420pgm.363.1588882147971; 
 Thu, 07 May 2020 13:09:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d203sm5547601pfd.79.2020.05.07.13.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 13:09:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: jason.wessel@windriver.com, daniel.thompson@linaro.org,
 gregkh@linuxfoundation.org
Date: Thu,  7 May 2020 13:08:44 -0700
Message-Id: <20200507130644.v4.6.I89de39f68736c9de610e6f241e68d8dbc44bc266@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
In-Reply-To: <20200507200850.60646-1-dianders@chromium.org>
References: <20200507200850.60646-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWmpd-000hUz-JU
Subject: [Kgdb-bugreport] [PATCH v4 06/12] kgdb: Prevent infinite recursive
 entries to the debugger
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
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 kgdb-bugreport@lists.sourceforge.net, jslaby@suse.com, agross@kernel.org,
 bjorn.andersson@linaro.org, mingo@redhat.com, bp@alien8.de,
 linux-serial@vger.kernel.org, hpa@zytor.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

If we detect that we recursively entered the debugger we should hack
our I/O ops to NULL so that the panic() in the next line won't
actually cause another recursion into the debugger.  The first line of
kgdb_panic() will check this and return.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Changes in v4: None
Changes in v3:
- ("kgdb: Prevent infinite recursive entries to the debugger") new for v3.

Changes in v2: None

 kernel/debug/debug_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 503c1630ca76..faf5bd4c34ee 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -532,6 +532,7 @@ static int kgdb_reenter_check(struct kgdb_state *ks)
 
 	if (exception_level > 1) {
 		dump_stack();
+		kgdb_io_module_registered = false;
 		panic("Recursive entry to debugger");
 	}
 
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
