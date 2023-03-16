Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA506BDA27
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 16 Mar 2023 21:29:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1pcuET-00080m-B8
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 16 Mar 2023 20:29:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1pcuEQ-00080b-Bo
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 20:29:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q3i1too33EMahveRbuxNasAN0FfHWaolQncNRUeKk3s=; b=ZHr+fpZeRCeA0Kf1SBAetJLC+5
 QDWPK2r4A7pYCWEZJKJqM+zV0Nmm/9nnTdIwHgeYgXDrnSUtYIjoipv+bs63Gbf6AI2/cuI3oS3mb
 60s6L8ActvgXoGdbzbLp03i+cb30XZO7UXKmw8b/tAFXlO0XOCsMYrHs1Iu1XYCNUPTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q3i1too33EMahveRbuxNasAN0FfHWaolQncNRUeKk3s=; b=m
 T74Vq/O6B0Ci8l7u9RXlRydRTg7zs3ROA/r0dAvvdzUxVkK50VjM1mP7ZbQk66m6PVijw8XraZzaa
 dV/Cb4KHkhHTjILYVIkxLJgtfcZwOzcfjhdzdpJCxbcMSARrOtUnMepmA2LIsRe3pouuj6evWRMzW
 xLFraNsmMP3arHxc=;
Received: from mail-yw1-f179.google.com ([209.85.128.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pcuEQ-0000Ce-CS for kgdb-bugreport@lists.sourceforge.net;
 Thu, 16 Mar 2023 20:29:50 +0000
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-5419d4c340aso54470307b3.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 16 Mar 2023 13:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1678998584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q3i1too33EMahveRbuxNasAN0FfHWaolQncNRUeKk3s=;
 b=NIulQexoKeOFfby0hifFc62DMyabcEAEu1GNulXBVuafuJWTMhakW7BSHGi4sGtrno
 k/7tff+BYBOg53JgRvo1MSwk9oNOUV+eR6CzxTWPn+MHL85KP/BUrLtbKhEWfQhuZENp
 4fGEfP0YJ0Z5byCE3O8FocNwZfGCHPchAFgt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678998584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q3i1too33EMahveRbuxNasAN0FfHWaolQncNRUeKk3s=;
 b=dZWmGAVoyx3WaWJSEa4OrI5gelKhQLGaXZLKYQRBAo2cRIuCbAe1rb3psums5hFV53
 ophiql1e8QGFA/NugWwTJZsPsV+IgrcX9ereK2OSuMIeHbbzR/YqXt9QswaOIZBpGWRT
 T8nlnA+pB/9Htc5x4PDFvETKNg2YCTfWHzyNg8mz2H7bQUnUGk/kNrq5KhqM9m7IDyEH
 bwcofD4fhumX4vWPdpW6JH9O5B38ux6jO4gSBHjfI95465W+JFL6LMm78mWPp7XSNtPo
 czHpM6gWhkjGVA0qf924uDPI6ZiBz/WauV2G+G43awmwa3ouM4DVfV9HLgLNkdBK8iTK
 Fi+A==
X-Gm-Message-State: AO0yUKV6frh8wFolVlk2cL0ZiUtSlbI2D0DfYbxw4K1goaAypqN6np1o
 mHYYTv+vXpp0JewoZGP2dZ9LJH+cXpQh/PPIrvk=
X-Google-Smtp-Source: AK7set9yssgAFQezxJ/RfIneXy6O9/6hx6IWvENqFQh8FK49jmaaVVUPU6K/d3qqZDHF4VNoOI1Xyg==
X-Received: by 2002:a17:90b:350f:b0:23f:35c8:895 with SMTP id
 ls15-20020a17090b350f00b0023f35c80895mr2925707pjb.32.1678998079225; 
 Thu, 16 Mar 2023 13:21:19 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:4db6:6f23:6ad2:998d])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a17090a5a0400b0023acdac248dsm24114pjd.15.2023.03.16.13.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 13:21:18 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 16 Mar 2023 13:20:55 -0700
Message-Id: <20230316202057.4070382-1-dianders@chromium.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Today to get kgdb to work on qcom-geni-serial devices you
 need _something_ to init/power on the UART. This could either the kernel
 console
 output or an "agetty" running on the port. If nothing else po [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.179 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.179 listed in wl.mailspike.net]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pcuEQ-0000Ce-CS
Subject: [Kgdb-bugreport] [RESEND PATCH 0/2] tty: serial: Fix kgdb on
 qcom-geni-serial when no other UART users
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Today to get kgdb to work on qcom-geni-serial devices you need
_something_ to init/power on the UART. This could either the kernel
console output or an "agetty" running on the port. If nothing else
powers the port then you'll end up getting a silent hang when you try
to enter kgdb.

Let's fix this. The first patch here is for the tty layer to make sure
that we power on the port when we init it for polling. This would be
important for any drivers similar to qcom-geni-serial that actually
need to be powered on. The second patch here hooks up the poll_init()
function for qcom-geni-serial, leveraging an existing function in the
driver that does everything we need.

Originally these two patches were bundled together as pathes 2 and 3
of a 3-patch series.  We no longer need the first patch from the
orginal series since we landed a similar patch from Johan [1]
instead. The second two patches are still useful, though, so I've
reposted them alone and added this cover letter.

[1] https://lore.kernel.org/r/20230307164405.14218-1-johan+linaro@kernel.org


Douglas Anderson (2):
  serial: uart_poll_init() should power on the UART
  tty: serial: qcom-geni-serial: Add a poll_init() function

 drivers/tty/serial/qcom_geni_serial.c | 1 +
 drivers/tty/serial/serial_core.c      | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.40.0.rc1.284.g88254d51c5-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
