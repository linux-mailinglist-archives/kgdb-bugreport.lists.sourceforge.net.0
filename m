Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F63C2B75
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 10 Jul 2021 00:41:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m1zB8-0006jp-0C
	for lists+kgdb-bugreport@lfdr.de; Fri, 09 Jul 2021 22:41:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <dianders@chromium.org>) id 1m1zB6-0006ja-7Y
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+VTL8Gr8cJGnFpMbzE4kHRz33cFbsQ4k7/+zTR03H1M=; b=cK+BYExqPuW+7CWOipj36NmuSi
 tiRX+ByGi9DXkajxX00PH0j5DkiwqSh/HMSTAAC5vC8ASds4eX/qmazrfd8WB8q6UaiVZtHazGOXu
 /YDrtE4BF+0wyIcToipgwULhm6A1/l2q5ffZSi7rDmAS8Obzn0YnlNbeMPKDtxBRBums=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+VTL8Gr8cJGnFpMbzE4kHRz33cFbsQ4k7/+zTR03H1M=; b=b+sxCcf54m/EP9CcHCJMuk/IFK
 8hrcaYkTKPOh2dr52cnIZ3PUcTa2PI3fwm8buOL4Vz51rUCuYo3QLN5ggYNEYBqZ6NTowUhiGJjTu
 2PN6cnZlUddpERetE5OPPwaT2rA5bCm18SgEvcMkkTtK3HZEVS2wH1PwC+IGWwKrO7Hc=;
Received: from mail-qk1-f180.google.com ([209.85.222.180])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m1zAz-002Zga-Sz
 for kgdb-bugreport@lists.sourceforge.net; Fri, 09 Jul 2021 22:41:00 +0000
Received: by mail-qk1-f180.google.com with SMTP id b18so11166602qkc.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 15:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+VTL8Gr8cJGnFpMbzE4kHRz33cFbsQ4k7/+zTR03H1M=;
 b=hjb/0vtyb9pSfK7D73LWl5iA20Zr54Uan5z9Z4bQEY6T7TkoJclXQnNFY34VWLaIjM
 MeVAduiH7O640f1IAxm6nMtnAn83bB/l11SFPnybDZrWICQi9vkSAUPCy7lmIlehxU5S
 Z5DAFcN8C1wsu7sh6NZ3vl2ESWHiG2zuDZKbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+VTL8Gr8cJGnFpMbzE4kHRz33cFbsQ4k7/+zTR03H1M=;
 b=hPYemC+6KihfVGozljEjTocJ1in2DY47h4+yWJ0y3GIELKj3X45aknaUEBJzV3x0ZC
 +74ZKj83OJUsNONs7OomBCDfrnGcCOhGLsNMNbLMAQ6DA9k9D8fqc0hbBuQbBbVG2oEl
 kPN1HXq3i+8oITqOrfU/m8eVBImRGi6ZOhft/lPQbelu8p1ho8ToJIGCYUXJCKMLIGdo
 9yiW95D/kDumQEm4IHJqSz7C5lgHqm/TmgkE+OSSFruDj8ByxSiRc8WVK00hj6DE12/j
 NkDRBUpj96/0D6JxblP53T+wiVNLz95a4RWlq99kueGuccgmo3+5ub8MkLaQ5aW66lpt
 v9pA==
X-Gm-Message-State: AOAM530pDtNhU6eDABMkNLlP7lDGaVYVw9K0cdQxPmL5W3zIkiLQnpTm
 /EUR3uegaf/LJIMm8RoZUImDuFzY6Bqr3Q==
X-Google-Smtp-Source: ABdhPJxw0GRkr0rtZpD5pnLz7aGe9DSXFlbmO2OSuF24+xjVy7XpJddS36KSqZR7xlid9SGceakutw==
X-Received: by 2002:ae9:e71a:: with SMTP id m26mr15387098qka.255.1625866645668; 
 Fri, 09 Jul 2021 14:37:25 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179])
 by smtp.gmail.com with ESMTPSA id k66sm3217290qke.28.2021.07.09.14.37.24
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 14:37:25 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id g19so16647329ybe.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 09 Jul 2021 14:37:24 -0700 (PDT)
X-Received: by 2002:a25:d97:: with SMTP id 145mr51777675ybn.276.1625866644411; 
 Fri, 09 Jul 2021 14:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210709104320.101568-1-sumit.garg@linaro.org>
 <20210709104320.101568-3-sumit.garg@linaro.org>
In-Reply-To: <20210709104320.101568-3-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 9 Jul 2021 14:37:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrfJEH-VYcf9ULC0pA5x0ju422c8GM1G1y33mJOmv1Fw@mail.gmail.com>
Message-ID: <CAD=FV=WrfJEH-VYcf9ULC0pA5x0ju422c8GM1G1y33mJOmv1Fw@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.222.180 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.180 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1zAz-002Zga-Sz
Subject: Re: [Kgdb-bugreport] [PATCH v4 2/4] kdb: Get rid of redundant
 kdb_register_flags()
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
 kgdb-bugreport@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Fri, Jul 9, 2021 at 3:43 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Commit e4f291b3f7bb ("kdb: Simplify kdb commands registration")
> allowed registration of pre-allocated kdb commands with pointer to
> struct kdbtab_t. Lets switch other users as well to register pre-
> allocated kdb commands via:
> - Changing prototype for kdb_register() to pass a pointer to struct
>   kdbtab_t instead.
> - Embed kdbtab_t structure in kdb_macro_t rather than individual params.
>
> With these changes kdb_register_flags() becomes redundant and hence
> removed. Also, since we have switched all users to register
> pre-allocated commands, "is_dynamic" flag in struct kdbtab_t becomes
> redundant and hence removed as well.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Looking at v3 responses [1], seems like you forgot to add again:

Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>

This also looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
