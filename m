Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CA38B3DEE
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 26 Apr 2024 19:24:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1s0PJX-0003mM-FB
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 26 Apr 2024 17:24:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1s0PJU-0003mB-P8
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 Apr 2024 17:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3qqKoN3Cs2CMvL9+4IpXPpoLPFKBjdTNuQHYkWXdJ8k=; b=BvK3OT0U1VsVCp71mpDMxsfH53
 eYZAQB7KIUAn6BHpRxumoFAaAF+l+WlW7ndrw5AVXdHPT2pVPU2ztJJQz/Fm5MzoUsGVftRQPZ5VK
 JX0MfOqrl3tu8th8lXRGiUYcalgJSvjas5/T7NN/Beee3HoQ5TrRAyEOR8X8Cn+57W+U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:
 Subject:References:In-Reply-To:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3qqKoN3Cs2CMvL9+4IpXPpoLPFKBjdTNuQHYkWXdJ8k=; b=O4jwxFqkQ9L8Ji4qCV9w1Q4r+R
 WEFYAi1EZJvxDT5HTYsA22lw5X2bIf5UkiFIq6yUVS5avQgkvXck+rruv3YflnS4U9CIvjurOd7Cf
 UFQYTla9/MbdcvXR7E8KGqRj1nN47aplWwnZWwk2Qj/cDGksubkDuCbWTASonQHwJB88=;
Received: from mail-wm1-f50.google.com ([209.85.128.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s0PJT-0002kl-Op for kgdb-bugreport@lists.sourceforge.net;
 Fri, 26 Apr 2024 17:24:44 +0000
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-41bc24cde88so342765e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 26 Apr 2024 10:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714152278; x=1714757078; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3qqKoN3Cs2CMvL9+4IpXPpoLPFKBjdTNuQHYkWXdJ8k=;
 b=llZVaypjIX8+bRFNk6QB3CWRiZjXNCXXBqDb2jYy78T/7rgnpXq6g2G7T7PSbT7dp/
 bip6VNDHwKf/KiGbNQvg2OL/8hGZW33ly22mHdmyPVFqdRuzLoRnuzzw09Wy6bbhLmvB
 A2M0M+LfSEic41UGLD7XatCqVNZ5e358zq0Ahokm3r4int68HM9P05Wt2cOwuOSRXpA8
 QpqBqLmVrEM1lccYYbIkHlDqn798tUCdBBCSF43AqgWCqeCU3YNosn8dKat1Z1jKiNuq
 3yiKFyRUvvQTpOORv3orgxu9vghwx7MzUPqb+B0nAWfhkaq4k4c89szT4QH1z6EIhk6o
 x+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714152278; x=1714757078;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3qqKoN3Cs2CMvL9+4IpXPpoLPFKBjdTNuQHYkWXdJ8k=;
 b=KoZ92hqLoW/m27813VZDKI5Sm/+Oo+tp7UgAZmSJOybyM+yzUsOsRSXBVBoeEXgRFS
 e7FSCOiW4jcjMSDxQg3JrsRJayi24wo/CgwCdOGKbNWc8DgCGOTlnaWhyBL6HDNXmkVe
 oLdZSemT9WyqMHX3ZNNXJa35sBzh9vIXOjUPgqp/n8raex96bfReM5JaHAhHtFyqLx46
 2dE/uLaZ4LVrmIE18ZpOk8fH9xBjLQ57oTWXDB56a35UZ+fvBUoQm/UcXuBdRY7rOxWe
 fDhu3wfqBxI56BcIDYa0rG9A1r+8GvkfnN/AQ773KpTao0oZAT6DXF69OrpsVpILn4DZ
 iY3Q==
X-Gm-Message-State: AOJu0Yxs6q2yu+ahcOmUZJvwWyh+HHCWKD0GLM6Q/KCWaZegWJgTjJVj
 pKWDwXijX79LS793xXpQOezO9h8zna2CrJjZxMB84BVbzker3vLrLi5MqeTcAyQ=
X-Google-Smtp-Source: AGHT+IGiLctEE5oagDVIXdCcyOY9hQhgwc3V8m4ovCCyUNb1qls37u6auNYTNu3nuXEcmxVuCzgDxw==
X-Received: by 2002:a05:600c:1f95:b0:41b:13c4:b9f with SMTP id
 je21-20020a05600c1f9500b0041b13c40b9fmr2238549wmb.24.1714152277603; 
 Fri, 26 Apr 2024 10:24:37 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 z2-20020adff742000000b00343ca138924sm22893737wrp.39.2024.04.26.10.24.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 10:24:36 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>
In-Reply-To: <20240424-kgdboc_fix_schedule_work-v2-1-50f5a490aec5@linaro.org>
References: <20240424-kgdboc_fix_schedule_work-v2-1-50f5a490aec5@linaro.org>
Message-Id: <171415227582.138568.453198683698011375.b4-ty@linaro.org>
Date: Fri, 26 Apr 2024 18:24:35 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 24 Apr 2024 15:21:41 +0100, Daniel Thompson wrote:
 > Currently, when kdb is compiled with keyboard support, then we will use
 > schedule_work() to provoke reset of the keyboard status. Unfortun [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.50 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1s0PJT-0002kl-Op
Subject: Re: [Kgdb-bugreport] [PATCH v2] serial: kgdboc: Fix NMI-safety
 problems from keyboard reset code
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
Cc: kgdb-bugreport@lists.sourceforge.net, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Liuye <liu.yeC@h3c.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net


On Wed, 24 Apr 2024 15:21:41 +0100, Daniel Thompson wrote:
> Currently, when kdb is compiled with keyboard support, then we will use
> schedule_work() to provoke reset of the keyboard status.  Unfortunately
> schedule_work() gets called from the kgdboc post-debug-exception
> handler.  That risks deadlock since schedule_work() is not NMI-safe and,
> even on platforms where the NMI is not directly used for debugging, the
> debug trap can have NMI-like behaviour depending on where breakpoints
> are placed.
> 
> [...]

Applied, thanks!

[1/1] serial: kgdboc: Fix NMI-safety problems from keyboard reset code
      commit: b2aba15ad6f908d1a620fd97f6af5620c3639742

Best regards,
-- 
Daniel Thompson <daniel.thompson@linaro.org>



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
