Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 016A83DB6D7
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 30 Jul 2021 12:07:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1m9PPy-0002ky-Q1
	for lists+kgdb-bugreport@lfdr.de; Fri, 30 Jul 2021 10:07:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1m9PPx-0002kC-A9
 for kgdb-bugreport@lists.sourceforge.net; Fri, 30 Jul 2021 10:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lXeo4aYimJxnDYbg1LxiGfrP/ZMdpRBQtu3fCof7FPk=; b=LJz78WremmGDxu2zUrz1XuZ6+b
 TFKzKTZIWzyCYH97YPOSiNLq1fGQnc3+ACmCJ2XNr1mynVkfjTwMOCpSO6nKDKVY+kQjY+VVq6FGk
 KH3GN1iLYA0VW9lVhFYR86NHV5vrDz29WTc/0jOcl4a1NN7X8ssr2iWEFtC91NcU/ADA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lXeo4aYimJxnDYbg1LxiGfrP/ZMdpRBQtu3fCof7FPk=; b=EtseMjQk/i3CZdIlfFqA1e43dT
 N+HwnU2vM/57sTkiYTKW4bmkyj3MDbkZ2asxCsmtHNf0aDFx/+mgTKmOdGNFpKTWU3q5jJ8eKZW29
 eXrxjTYvaqo9fz8BRzMbtXs8rlCi7g11TBGi1akxkZJJw+iS60uuEyEPf1M2YJUveGAA=;
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1m9PPv-007dVW-IQ
 for kgdb-bugreport@lists.sourceforge.net; Fri, 30 Jul 2021 10:07:01 +0000
Received: by mail-wr1-f48.google.com with SMTP id n12so10617679wrr.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 30 Jul 2021 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lXeo4aYimJxnDYbg1LxiGfrP/ZMdpRBQtu3fCof7FPk=;
 b=mOjmNOYoHokGGePIZRcmD3gOaE94LdsYLCHIj4lM+x6RYFUApXN6nfoqBo/simcvys
 l4RxXIzFK5fqrBT00aI2XhEcWGkoFqDH//ioOuUVmJGZPRyhIUhGu8ClHKo7yLC8g7eZ
 THklx+EvGI0j1nAE59MHy3pAxePq7Bn4/w6X26ATFZoLSpS+rKtdABt/pYcAuWACDhJR
 YVDq/UR8cM4hdV9KU20Hq9pgd8XAyFPLxckbMQwVGIJRBMLjYxUbKBtAJQsGmojHwWUZ
 cj6z6FyS2LTmJeZ9qIrGqE/cl7HSwuhjBPAaOFjcjZwbYzGQ7mt0Far/OUHQJhKL9qq8
 UPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lXeo4aYimJxnDYbg1LxiGfrP/ZMdpRBQtu3fCof7FPk=;
 b=Vd35dvV+s690x66uCJqQDGUmADnCq4IF03VJdgLDk4zHdX/WuJSFR1y2majdQG+Hk+
 Vxpn7oSpB6++KYFxahmgSr0Rmnotk0WCC729xGZITUm3pdm9rs6kowYVt7MRo4EXu/7X
 Fgi8BvjN4dlld1j91cRm0ap0erpOrGhNdzigsjxz9gNxFj36+OSDQxK9FtLvBEz0WmM8
 8PJF1vc6VlKTMFmOOCLnjXm+ekcqbVkha56PBwV+WbxhrNfitIIlyNFH8uzk15ggOXs5
 9/lEfkI4mtJW5+Ql38LiY9Zr90Bale98IQNpa6hM/mN41wcSwOcp8752oYuPqDlMqbjy
 z58Q==
X-Gm-Message-State: AOAM531f8iYiAQFATVlhgQRkar1OpQr8BJS4PEHd+DzD1CmXB35zy0rV
 D4lpioa6FXYmhTym6SdWg39ysQ==
X-Google-Smtp-Source: ABdhPJxFAazihg9MdTDdS5uuWJN6e8/9LMeef8q0AuiVhN8vBu+SBt8FIrQUlK0YUML22N51OKwj8g==
X-Received: by 2002:a5d:4585:: with SMTP id p5mr2136596wrq.265.1627639613172; 
 Fri, 30 Jul 2021 03:06:53 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id v12sm1161711wrq.59.2021.07.30.03.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 03:06:52 -0700 (PDT)
Date: Fri, 30 Jul 2021 11:06:51 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210730100651.of7dd7jzjmzpzfcx@maple.lan>
References: <20210712134620.276667-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712134620.276667-1-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.48 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.48 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1m9PPv-007dVW-IQ
Subject: Re: [Kgdb-bugreport] [PATCH v5 0/4] kdb code refactoring
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Mon, Jul 12, 2021 at 07:16:16PM +0530, Sumit Garg wrote:
> Some more kdb code refactoring related to:
> - Removal of redundant kdb_register_flags().
> - Simplification of kdb defcmd macro logic.
> 
> Tested with kgdbtest on arm64, doesn't show any regressions.
> 
> Changes in v5:
> - Incorporated minor comments from Doug.
> - Added Doug's review tag.
> 
> Changes in v4:
> - Split rename of "defcmd_set" to "kdb_macro" as a separate patch.
> - Incorporated misc. comments from Doug.
> - Added a patch that removes redundant prefix "cmd_" from name of
>   members of struct kdbtab_t.
> 
> Changes in v3:
> - Split patch into 2 for ease of review.
> - Get rid of kdb_register_flags() completely via switching all user to
>   register pre-allocated kdb commands.
> 
> Changes in v2:
> - Define new structs: kdb_macro_t and kdb_macro_cmd_t instead of
>   modifying existing kdb command struct and struct kdb_subcmd.
> - Reword commit message.
> 
> Sumit Garg (4):
>   kdb: Rename struct defcmd_set to struct kdb_macro
>   kdb: Get rid of redundant kdb_register_flags()
>   kdb: Simplify kdb_defcmd macro logic
>   kdb: Rename members of struct kdbtab_t

Series applied, thanks!


> 
>  include/linux/kdb.h            |  27 +-
>  kernel/debug/kdb/kdb_bp.c      |  72 ++--
>  kernel/debug/kdb/kdb_main.c    | 626 +++++++++++++++------------------
>  kernel/debug/kdb/kdb_private.h |  13 -
>  kernel/trace/trace_kdb.c       |  12 +-
>  samples/kdb/kdb_hello.c        |  20 +-
>  6 files changed, 357 insertions(+), 413 deletions(-)
> 
> -- 
> 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
