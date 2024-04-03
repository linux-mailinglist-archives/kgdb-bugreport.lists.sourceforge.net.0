Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80589695B
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Apr 2024 10:46:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rrwG6-0001UP-Gp
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 03 Apr 2024 08:46:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3VagMZgsKABAzA89y389y99w44w1u.s42@flex--justinstitt.bounces.google.com>)
 id 1rrpIt-0004zo-N3 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 01:20:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2LtWRlkSNk32zYyNyz1b834Pph06BPJDWHucHrmrXSY=; b=mH8b58x1BFPFPE288accVQiMSQ
 bS1KQiACWcAbz2mpJNV8UVpBg0RQ7MLSxAJvRZpZzi3EtifgXKMjvz713UW5M0pLS1ONWiprgCMMQ
 OmXbDZbNwJakDROrW5RQapYAKaFgusujxsVeTBNR3w9w3NMrtqQvEY0uczQ4oy5IiLbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2LtWRlkSNk32zYyNyz1b834Pph06BPJDWHucHrmrXSY=; b=X
 Djzp/oiEhWDRSJmEUiY2XRHEwxhd/oOuztoHAoZB8N58EWNkamdq5fdFfs1UDZAaWPqQpXgtK0NHv
 XJlO+0yA049sQ7twj0Q6EB8AgUlFm49BpwxhVTWXW30rlmcDUFrv0dSorI04n7ngpr1185TfaqW0M
 Jx8e61MFS3miGvDg=;
Received: from mail-oi1-f201.google.com ([209.85.167.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrpIt-00067g-31 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 03 Apr 2024 01:20:39 +0000
Received: by mail-oi1-f201.google.com with SMTP id
 5614622812f47-3c3d6cb8713so4760353b6e.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 02 Apr 2024 18:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1712107229; x=1712712029;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2LtWRlkSNk32zYyNyz1b834Pph06BPJDWHucHrmrXSY=;
 b=c38T6e8+AuCvMrU66FY81v40ZePFva3eopKxOhm857Q5O02GECAJ37sJjl80DpzNoj
 CqeVDAIvMR26aw0lIdGxG5jhFXE2I70Y/dyUPo+ffWjOJLOw/5hHoakgIFvFNdSq5Bxb
 zB2sxaKnKcnNBM6cubozPLfmf5fRdRDBB0L2AJJxNduJzGKqnwOEuP3Q6+p506XzPckE
 OIsAlllrXwOMxcQMBrsYnVmGHhoeUg4WBvbWfdroL6QQq4+RTx7BXenz+LWRIdQjwX5e
 Mb+LK1knDbMw81zGQonLFOnG2bgJVNm2e47cFAaurZ5HPQlVKmFcVlRqn+Q+hgLIE/1Y
 EcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712107229; x=1712712029;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2LtWRlkSNk32zYyNyz1b834Pph06BPJDWHucHrmrXSY=;
 b=rF2NI+wO2Uueaj7hvWlALOkz0yJFAPuR5L4YbV5QOK0R2bSMGa715RYampYgNrI2pM
 KrRTT/vgDsmox1pfIrbeN3/U2y88g9Nax+/aEQ4GPWnLshddtAtMjOYWGp7T1G+OH1Dn
 tUA8P4ywRIMCeo3kk+w/rAz4NddOWvgtXDoIyf4S27ndqNJScIy+6CepkaEanu4FlcPA
 G5EIxoEhDuhK6XAVxZ0F1drTc4Lr+UE3+vyWbhp68rFY4Z6U3f/E0nv6kjrq+wWP4XV7
 5Sxdw7/bE1u07d1bNrJ+vqgsAjegMWoL3Atnr9QvWk7UhTMXGDuWvsc26fytTWYDaIC5
 yQhg==
X-Gm-Message-State: AOJu0Yx3rK3Pi1AA4Cwy70Fl13fvT1VAlKZcerz9crP6nwZsOpnlMBLA
 CIawS6hPybHjBznP8cQQ+1kWSbnTgTQNdrouPDp799ZMbl6xp6e/+OcsU32/H2HGleVikXp8vr7
 MzzXK9X7SFkBMxuXGayGUFA==
X-Google-Smtp-Source: AGHT+IENHtMGTKiMA0s2/kOwugq4yr4dOndu0KnzLEY/2IVlh0JUmWjmdLHBkuswQWDSDEhDP1VdBsuAqxFROrPxgA==
X-Received: from jstitt-linux1.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:1b09:b0:dc6:c94e:fb85 with
 SMTP id eh9-20020a0569021b0900b00dc6c94efb85mr980999ybb.2.1712105557231; Tue,
 02 Apr 2024 17:52:37 -0700 (PDT)
Date: Wed, 03 Apr 2024 00:52:36 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFOoDGYC/x2NwQ6CMBAFf4Xs2U1qAQ/+CjEGuk/cQArZKoEQ/
 p3qYQ5zmdkpwRSJ7sVOhkWTTjHL9VJQeLexB6tkJ+985SrnOX0shnnjARYxsqD79jxI9+OpEwe
 uS9QQf5O2FMqd2fDS9f9oHsdxAlV4hjpzAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519;
 pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712105556; l=1581;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=AMBZZucRDLbkCBnpUsFkHT1Acvq2JW3K7G/CZEuEqfE=;
 b=5vCiLZjVHanyhM6gz89NkA5pyYDVG+O71KYpStpAjblh7KSvarGbuKYfVC5QMLNwXCs/IhIuP
 Rq24m4eV/t/B4SeYnsudISx/x6NQCQ+38VqG8fIE7d7TQ8vT8eU4wBo
X-Mailer: b4 0.12.3
Message-ID: <20240403-strncpy-kernel-debug-kdb-kdb_io-c-v1-1-7f78a08e9ff4@google.com>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All the other cases in this big switch statement use memcpy
 or other methods for copying string data. Since the lengths are handled
 manually
 and carefully, using strncpy() is may be misleading. It doe [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1rrpIt-00067g-31
X-Mailman-Approved-At: Wed, 03 Apr 2024 08:46:13 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: replace deprecated strncpy
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
From: Justin Stitt via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Justin Stitt <justinstitt@google.com>
Cc: kgdb-bugreport@lists.sourceforge.net, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

All the other cases in this big switch statement use memcpy or other
methods for copying string data. Since the lengths are handled manually
and carefully, using strncpy() is may be misleading. It doesn't
guarantee any sort of NUL-termination on its destination buffer. At any
rate, it's deprecated [1] and we want to remove all its uses [2].

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90 [2]
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 kernel/debug/kdb/kdb_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 9443bc63c5a2..8bba77b4a39c 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -368,9 +368,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf("%s", buffer);
 		} else if (tab != 2 && count > 0) {
 			len_tmp = strlen(p_tmp);
-			strncpy(p_tmp+len_tmp, cp, lastchar-cp+1);
+			memcpy(p_tmp+len_tmp, cp, lastchar-cp+1);
 			len_tmp = strlen(p_tmp);
-			strncpy(cp, p_tmp+len, len_tmp-len + 1);
+			memcpy(cp, p_tmp+len, len_tmp-len + 1);
 			len = len_tmp - len;
 			kdb_printf("%s", cp);
 			cp += len;

---
base-commit: 026e680b0a08a62b1d948e5a8ca78700bfac0e6e
change-id: 20240402-strncpy-kernel-debug-kdb-kdb_io-c-53e5ed26da3d

Best regards,
--
Justin Stitt <justinstitt@google.com>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
