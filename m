Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D0342314
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 19 Mar 2021 18:17:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lNIkb-00036v-MP
	for lists+kgdb-bugreport@lfdr.de; Fri, 19 Mar 2021 17:17:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1lNIkZ-00036M-5h
 for kgdb-bugreport@lists.sourceforge.net; Fri, 19 Mar 2021 17:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NmOSs5tEu47Laoh1qxa+rl3JlDXehYKJh6XfrCU+SRM=; b=UOPfr5IOWKnoteSP9qm2WmReUW
 E7+GM539KFGHNLiYV7VDQaBoXw8TFIsxf9rZiTgiWLn5G709/hiLAfxhFHFAjZl8WAQRPEmCEo7dA
 +ldAMxLeDGs2U6IgPcNe3Gy7t08N+qojmWsiqIg1n2DwvyrOMlqsMSGILJnF5nSaWB+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NmOSs5tEu47Laoh1qxa+rl3JlDXehYKJh6XfrCU+SRM=; b=ei+BQaf+8MzXCvCqnSxy6HC8WQ
 89Rcgs2budrqLZbiAEEqG6nChiErMZvgO3xw1BBhzay46JoCXz5GGOBOz4mzvtBEQNc3gV1p4CgQg
 5QWxZXnks8Amj4FpDVHNFeLwiK0ZzKOKn0WMoPdUnSmixxpA7BqTSI+dSFqoKG1heZsM=;
Received: from mail-ed1-f47.google.com ([209.85.208.47])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lNIkS-002Q2r-QX
 for kgdb-bugreport@lists.sourceforge.net; Fri, 19 Mar 2021 17:17:27 +0000
Received: by mail-ed1-f47.google.com with SMTP id e7so11614708edu.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 19 Mar 2021 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NmOSs5tEu47Laoh1qxa+rl3JlDXehYKJh6XfrCU+SRM=;
 b=OU2XM07/P0SFEX8dpG4FteiSW0vErpq78CdkpTISEI3TrhMSkCQcs2ABH6+r8ZkqkH
 NZloQc4xFVaGBSYiMCFUkfobMcc+GMn30T3hfWLv4FEEUqpHWaVZGE2AeuluiUkET39b
 t6WHSkoXxOlo5HJXOQr6qp1ePUp2KERBezcJio2ikhSdUIWgm8C5MKFx/ra+RI/IC7DF
 s5yi/XZu5xM02hzzAy+lhL6rcfPl+U9Be+soziyfLPm1VE4HneXtj6foLwOOKTpLQPh7
 lR7E1oBw+EKZuyWHKTfP3QW4b+cBxthHGrWJhPGxZIOn53SAltZYkjEk6wfy7KiUprKC
 25fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NmOSs5tEu47Laoh1qxa+rl3JlDXehYKJh6XfrCU+SRM=;
 b=NmfGPqDfzd7Q+bnJr4Sm6BsmBPuGGdP8o3ZwCa+TsgqgfQ3I0EfagmUff7v48L2X3r
 zi2Qq5nvgduC7knjsd0G0JjXxAxi9ssCPPyG8ThcG8ou7OSP4DHlSoJmPKTowKlA9Xcn
 rY6q4MVHN8T6WjkT4fdDTicqQd9zhD+gcdtkyXkMCoJh+fgKCDUXEAtwtMWvbfPKkkf+
 ejabMdqhVb/EcCpnAV9fiX6ULi20N8ywlxHgbv76zp2loErKy9XLr+Nti7BX14oRWlCr
 BY1MXRN9rTrKriA8XmzdBVVBJiIFJ3lu8qMF91T3vhoCwIARlmNKtXL1gbOuMKXBQtHi
 4gmw==
X-Gm-Message-State: AOAM531VvbE901CCskKvBhJB2216ixDteLH/Licg/SzzQ6SpbarSpdro
 ED9PvaB27o0WUbrl7/C9IYuu2g==
X-Google-Smtp-Source: ABdhPJzOFq4v0Lwd4dwxfKOLdM+czU7z6OYUykk7hRaTQS/S4dNiOJFeqlritMVFyedzsDiN0+tPmg==
X-Received: by 2002:a05:6402:1283:: with SMTP id
 w3mr10777157edv.340.1616174234323; 
 Fri, 19 Mar 2021 10:17:14 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r25sm3914743edv.78.2021.03.19.10.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 10:17:13 -0700 (PDT)
Date: Fri, 19 Mar 2021 17:17:12 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210319171712.vlkgnmp7cbnayxdn@maple.lan>
References: <20210309121747.859823-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309121747.859823-1-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.47 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.47 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lNIkS-002Q2r-QX
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Refactor kdb_defcmd implementation
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
 jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Mar 09, 2021 at 05:47:47PM +0530, Sumit Garg wrote:
> Switch to use kdbtab_t instead of separate struct defcmd_set since
> now we have kdb_register_table() to register pre-allocated kdb commands.

This needs rewriting. I've been struggling for some time to figure out
what it actually means means and how it related to the patch. I'm
starting to conclude that this might not be my fault!


> Also, switch to use a linked list for sub-commands instead of dynamic
> array which makes traversing the sub-commands list simpler.

We can't call these things sub-commands! These days a sub-commands
implies something like `git subcommand` and kdb doesn't have anything
like that.


> +struct kdb_subcmd {
> +	char    *scmd_name;		/* Sub-command name */
> +	struct  list_head list_node;	/* Sub-command node */
> +};
> +
>  /* The KDB shell command table */
>  typedef struct _kdbtab {
>  	char    *cmd_name;		/* Command name */
> @@ -175,6 +181,7 @@ typedef struct _kdbtab {
>  	kdb_cmdflags_t cmd_flags;	/* Command behaviour flags */
>  	struct list_head list_node;	/* Command list */
>  	bool    is_dynamic;		/* Command table allocation type */
> +	struct list_head kdb_scmds_head; /* Sub-commands list */
>  } kdbtab_t;

Perhaps this should be more like:

struct defcmd_set {
	kdbtab_t cmd;
	struct list_head commands;
	
};

This still gets registers using kdb_register_table() but it keeps the
macro code all in once place:

kdb_register_table(&macro->cmd, 1);

I think that is what I *meant* to suggest ;-) . It also avoids having to
talk about sub-commands! BTW I'm open to giving defcmd_set a better name
(kdb_macro?) but I don't see why we want to give all commands a macro
list.


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
