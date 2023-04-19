Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1146E85A5
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 20 Apr 2023 01:05:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ppGrc-0003i8-BH
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 19 Apr 2023 23:05:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1ppGrb-0003i2-Ht
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4J3L1PRmmJQLOwITbbf3gVcO1wn/5q5E8+agGJxBWhk=; b=nGmVc3bLPI/MtMdsjJpo8Sh8tU
 pLg6wyz3RjwZ9Gtz/uZ6Shp9J5F8X1TwPLsAISEU+ue4sJff+apkvEKeoMbXg4zYt+E89JCjqZ2Jn
 Id2+4U0YtMCZzOqqu/RSVd+ZaSAO24uBIzbk6+Zb2APUkNrfA03GaOQwgu+5AnZ+CYzE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4J3L1PRmmJQLOwITbbf3gVcO1wn/5q5E8+agGJxBWhk=; b=h9HucWsl7udYe65pt2NMPCFHh+
 D/3z4fo38ybxxn8IUVD38ikc9Sa5C1UU1WTNiQcPsD/zpBsmOuT/pxWp/04OOfzwfmyXgBHOCegBj
 O1yx61wzcawIUiQl6l6nerZ2Lz5jgaYajr7gVV7THE7dq4ht2HCUkNHmO1Oli+theLrc=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ppGrb-0003YQ-8t for kgdb-bugreport@lists.sourceforge.net;
 Wed, 19 Apr 2023 23:05:23 +0000
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-3ef3b52ff2aso629231cf.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 19 Apr 2023 16:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681945517; x=1684537517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4J3L1PRmmJQLOwITbbf3gVcO1wn/5q5E8+agGJxBWhk=;
 b=fVBIHRAjznh3+kLyozBhmDIObbKTIpQNEhUowzcCsA6ebVtKCAIjqWNdzqkZgyUAQy
 4xfGzBHZJs5YPoM9p+b7IQjcp9ZXjBZheFRTyONCWHQWwZtFBs8TcpcqySZ5piMDq3hg
 NCfh4I1JbJ7UmF3+vA6aeAzG9PL++1z+J95fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681945517; x=1684537517;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4J3L1PRmmJQLOwITbbf3gVcO1wn/5q5E8+agGJxBWhk=;
 b=ANh3Sg0Rji5zjlE1K/3R6JhAxFpgmwxasMPBBBgW4s3s3R1ZsyqhSed02AANAckvqd
 kLYLJhzWoCw7Cb63ihncyGMnVr/sdd6+OnG6Z7CfgE/wh3jt7gBMhc+ltvf7LWwuorVq
 tZXxqTl6IBCFgWZVm1GDTirVTWFTAa+QYkeHt7qchXRdTfJWiowEa6bbZwxaFYyEGFI1
 dJI21UDPpqN6zb5JJ9KydcIUHjWUtvST3DNT+bBcrCiv3zzc0oYZcEfi2zeg6nb/T9/y
 sXDAQ20UkwYVy3jIGczyMPKfkMLye+RpFZMmSDwsegtxa59zQwDHcsVtH0gsA/rscF95
 NK6g==
X-Gm-Message-State: AAQBX9dzFoWuLRelo0RAfPPvMobDvQLN/hhgymErgFQNoGLlzobN9JqO
 r8cQW3b2ibybYvG7d6J2xfdWeKXAk37ZORsGQ1M=
X-Google-Smtp-Source: AKy350aTf9h91DYGrz7a7xsj4nRmoGOHDhj7cVzB4J++cRvnc6ZJ8BMzmOpWvBoOUwZC9tzPMbxlhA==
X-Received: by 2002:a17:90a:69e6:b0:247:2680:4090 with SMTP id
 s93-20020a17090a69e600b0024726804090mr4649880pjj.11.1681945039604; 
 Wed, 19 Apr 2023 15:57:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:8b1:fa03:670e:b784])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a17090aea8f00b00246ea338c96sm1847101pjz.53.2023.04.19.15.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 15:57:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sumit Garg <sumit.garg@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Date: Wed, 19 Apr 2023 15:56:02 -0700
Message-ID: <20230419155341.v8.8.Ia3aeac89bb6751b682237e76e5ba594318e4b1aa@changeid>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
In-Reply-To: <20230419225604.21204-1-dianders@chromium.org>
References: <20230419225604.21204-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: To save architectures from needing to wrap the call in
 #ifdefs, 
 add a stub no-op version of kgdb_nmicallback(), which returns 1 if it didn't
 handle anything. Signed-off-by: Douglas Anderson <dianders@chromium.org>
 --- Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.172 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppGrb-0003YQ-8t
Subject: [Kgdb-bugreport] [PATCH v8 08/10] kgdb: Provide a stub
 kgdb_nmicallback() if !CONFIG_KGDB
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 linux-kernel@vger.kernel.org, Lecopzer Chen <lecopzer.chen@mediatek.com>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 ito-yuichi@fujitsu.com, Stephen Boyd <swboyd@chromium.org>,
 linux-perf-users@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Thomas Gleixner <tglx@linutronix.de>, Masayoshi Mizuma <msys.mizuma@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

To save architectures from needing to wrap the call in #ifdefs, add a
stub no-op version of kgdb_nmicallback(), which returns 1 if it didn't
handle anything.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- "Provide a stub kgdb_nmicallback() if !CONFIG_KGDB" new for v8

 include/linux/kgdb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
index 87713bd390f3..9ce628ee47cc 100644
--- a/include/linux/kgdb.h
+++ b/include/linux/kgdb.h
@@ -377,5 +377,6 @@ extern void kgdb_free_init_mem(void);
 #define dbg_late_init()
 static inline void kgdb_panic(const char *msg) {}
 static inline void kgdb_free_init_mem(void) { }
+static int kgdb_nmicallback(int cpu, void *regs) { return 1; }
 #endif /* ! CONFIG_KGDB */
 #endif /* _KGDB_H_ */
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
