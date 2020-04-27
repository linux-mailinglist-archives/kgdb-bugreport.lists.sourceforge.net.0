Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 932AF1BAA79
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 27 Apr 2020 18:53:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jT70R-0006Cu-Dn
	for lists+kgdb-bugreport@lfdr.de; Mon, 27 Apr 2020 16:53:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jT70Q-0006Cb-DN
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L+f5rXb1fm0ddPawdaHU5SqIUExIWo7ZaWY7+7ST/oQ=; b=WYcmLXr+wMeE0M6jXtYJsS8j5l
 O/cxQstSgHcuc4dbyp1plg228lnSbswrpYDOpb4QLByVtMgkiZ+rKogP2w8lUr01HlAAGtPlqlVl5
 9doxTPvqxwAdCxe2i0lvQBAU91gOI4V6Gqb64zK5QnasCXLXE1NlSB7JlLOaEepmaTJs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L+f5rXb1fm0ddPawdaHU5SqIUExIWo7ZaWY7+7ST/oQ=; b=PQAhYfHwTMNb2pXPFtbgljbrXk
 nY+rq7l0p0hGUzTJm8v3agh9UCILa9LUL7NzOyXWn3uHGgLwkWJywnJIDmJxJposBkjSQXMnsCNHB
 GJ8c2MjqsfzEqO8SjRUZ71xM1ow38K3z0q/p+EpksWsmgbfCYZoSvt9uFP0WFqoWQjHA=;
Received: from mail-wm1-f66.google.com ([209.85.128.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jT70D-000BBo-7Q
 for kgdb-bugreport@lists.sourceforge.net; Mon, 27 Apr 2020 16:53:17 +0000
Received: by mail-wm1-f66.google.com with SMTP id k12so384314wmj.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 27 Apr 2020 09:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=L+f5rXb1fm0ddPawdaHU5SqIUExIWo7ZaWY7+7ST/oQ=;
 b=qX0Zz/fnIDcCTmTrZNOvEAVu0G15kUG2va77BGRxQ+BmnBFWZsRrnaLHz5AJeDtNzy
 im1UlPKai40zbHFsTmlFjs0ZlJ8dSJxK5mwzZ+nAIEwEmIgCwcYm7RTGYxfXNXUnv7iT
 GvITdFyEQESb0fEeHG9nVNlC93iR5CJnTVdL0pJBSMI/cuHkO/7l0VAJaTkmAeFHzYYM
 zph00Gm2PW/XDw3Tg+sdx8+1m/6xFtHAP1MWzfbVvhm2Xbiz/TC41CE+rwGou+JPnFT8
 pd5dUPNqNOceRTLdcITOTJqqCb8zhCttUIrobwkSJqKbvweOrdCnityaPhTQz1J5bPDo
 cz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=L+f5rXb1fm0ddPawdaHU5SqIUExIWo7ZaWY7+7ST/oQ=;
 b=byWTSaF5TatbWP6KGXLHUWEzfO8nmkZRbSYmRDH4IsxHMzV239NRcq/xEJdvbVGE3r
 O1C2ZnMFxo5O7C7ns30GwfV9tbKv/Hh2dE4f8GEdT0CI/ineQ/t1oM4u0AWDztNe99hC
 s8CmISKIF6zGEcpBtUuX9e9SJ5snfOfL3L7XL8f30tXAfdlzeJMdU8GcTF5haR1knVLf
 VRRKh/8nfZv4rFdq1z34RFpDCnRf7JdEM/2kqoRvDvVbp5GQ5QNuAkzdT1AxOJ0yLh+u
 LiAnm/M3nhT74G1Uv9tcjfFLJlm1ra7af293xSt7DgGA9wBSMPPjK5EeS9tm402qlApt
 xMvg==
X-Gm-Message-State: AGi0PuZ+AW8XF+CwJdx/nf7nn4g/w/0rKyhKgUqEftWYrcqw2kUFbdxc
 D0M49FOwj3eoNpLY2gjo3kpH2w==
X-Google-Smtp-Source: APiQypIg33MdzG1fsD4Vtx7fCSqJxX2k4oqiO4ZdOMqbRC/BCATKrNwRWvi691/BgqaV0F5UCCKSag==
X-Received: by 2002:a7b:c927:: with SMTP id h7mr417005wml.122.1588006377727;
 Mon, 27 Apr 2020 09:52:57 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id v16sm16085225wml.30.2020.04.27.09.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 09:52:57 -0700 (PDT)
Date: Mon, 27 Apr 2020 17:52:55 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200427165255.bjwkjobfzinzzlxb@holly.lan>
References: <20200421211447.193860-1-dianders@chromium.org>
 <20200421141234.v2.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421141234.v2.5.I22067ad43e77ddfd4b64c2d49030628480f9e8d9@changeid>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jT70D-000BBo-7Q
Subject: Re: [Kgdb-bugreport] [PATCH v2 5/9] arm64: Add call_break_hook() to
 early_brk64() for early kgdb
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
Cc: Mark Rutland <mark.rutland@arm.com>, catalin.marinas@arm.com,
 bjorn.andersson@linaro.org, hpa@zytor.com, will@kernel.org, corbet@lwn.net,
 jinho lim <jordan.lim@samsung.com>, agross@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, Dave Martin <Dave.Martin@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, jslaby@suse.com,
 Alexios Zavras <alexios.zavras@intel.com>, bp@alien8.de, tglx@linutronix.de,
 mingo@redhat.com, Allison Randal <allison@lohutok.net>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, "Eric W. Biederman" <ebiederm@xmission.com>,
 jason.wessel@windriver.com, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 21, 2020 at 02:14:43PM -0700, Douglas Anderson wrote:
> In order to make early kgdb work properly we need early_brk64() to be
> able to call into it.  This is as easy as adding a call into
> call_break_hook() just like we do later in the normal brk_handler().
> 
> Once we do this we can let kgdb know that it can break into the
> debugger a little earlier (specifically when parsing early_param's).
> 
> NOTE: without this patch it turns out that arm64 can't do breakpoints
> even at dbg_late_init(), so if we decide something about this patch is
> wrong we might need to move dbg_late_init() a little later.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>

I haven't done any testing at this point (I'd hope to enable tests
for this in the test suite), however FWIW and just so you know I didn't
forget about this patch:

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
