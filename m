Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C1B153719
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  5 Feb 2020 18:57:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1izOvq-0002Dy-KF
	for lists+kgdb-bugreport@lfdr.de; Wed, 05 Feb 2020 17:57:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1izOvp-0002Do-As
 for kgdb-bugreport@lists.sourceforge.net; Wed, 05 Feb 2020 17:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BA/wxTBKBRtXyBJptwlCXymjnHMIAT83JNQdcmKZ7GY=; b=lBcxW87KgqsTtFM8YEI6taln72
 03I7vRNeR4Rb2Lz0JRzJXXVg55G9FMTGQ81msCNYPJERsIHkIwo7OtY83LlIaLeJu4vaGvKBmwrFc
 4hNX3eos9GeLdJdyCBqZe4F+RgTn0opwS8fRgN4S80vppb/v5DnYxZim6nvUjuQRfcU4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BA/wxTBKBRtXyBJptwlCXymjnHMIAT83JNQdcmKZ7GY=; b=JlMdlNGTJ5aKE9eHYt8Strtunr
 gqu4lk+yDmpWUQSrX8WD/RIMGnDUJwZSCKArMPd7d3dT2VzXZULjMcyAb4P+4rJ43J+FbrhiQ/RXl
 mHTtUHDJhUowUg54r+CND8rxOncjQKwJbAgVLElh8F+THZkoIrGXSzT8ycwDqvdrcUd8=;
Received: from mail-wr1-f67.google.com ([209.85.221.67])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1izOvl-00BBbG-F9
 for kgdb-bugreport@lists.sourceforge.net; Wed, 05 Feb 2020 17:57:45 +0000
Received: by mail-wr1-f67.google.com with SMTP id y11so3864753wrt.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 05 Feb 2020 09:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BA/wxTBKBRtXyBJptwlCXymjnHMIAT83JNQdcmKZ7GY=;
 b=UpL5Z4PGv5IbifOCXJmA3EvKU8pwWTuibgFkCYerfZ0RWYMWJsc8jdRFKSdHulhrWW
 0q5QFjVXGqO8N3azYMUT6BuQ70iIsYooSH0EN3NCB1U+uAl0UOubOv/x84pOWUnwZOfz
 nqLUdyrNpbx9UQKrlex68a8wL6FXpMdsVOp2ImierJGNMKjy/XyENBdZuZ87OyOllEPm
 3OBBBIUFzK0S2Bmis4vn5z0G3ksW8K0PQM62ik+UqemshCq2wrtaGg6nGM95ryq0m1oV
 bjtOm73AnLl8o+WYQlLgbQBG72NiEnexJulDQcDQhqCPvLnUWDJPV8Z2q1LLoi5XlXbF
 6avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BA/wxTBKBRtXyBJptwlCXymjnHMIAT83JNQdcmKZ7GY=;
 b=I94zqsXlQFwKusYoPyZG4FYeh6yQwTTFedyIuEpi67LzWAw+9hxGbboInYXRpRJaGZ
 ZlXaHzWTjURuENzgFcQ2ZIa7oF3RxeSkMaSwX1PwL0iYMkKvS9GF+ui+7b/u+qB/qkmh
 8sqRcejdiUn6tXhGJ0a3UXS0iHReJCvtiouG+RaK5V/CxZHnX6Be6DBmUMpREMZsrgkC
 3cx/kRlpzG3X4D5WE1NRUJewZKhGqCczWyWCBc4GpinVZbVd6Rh0ulDWFf+eeOAwi4PC
 PzV0K0qc2h9VnZeRog4jidbJjtBdj4CwmFPEJV3awxLCdz6a8iorCQ4y74cacyeu8+0l
 51QQ==
X-Gm-Message-State: APjAAAVZmHpuaMQ2OkTOV3nhHQrIVp7oMvZYa8eXmpOsMYxd+H9YkuL0
 VQtq/Aav7xDCJ3SCDjtaMArJPVcviNdOmg==
X-Google-Smtp-Source: APXvYqye1mYri+CUv+WS55ZmHdq9oGdILOb6XRaB+Cltp8xHrBe9SWrvZi+EHPv63nSK5VzAySrxaw==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr31507302wrn.254.1580923844315; 
 Wed, 05 Feb 2020 09:30:44 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id d13sm651699wrc.3.2020.02.05.09.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:30:43 -0800 (PST)
Date: Wed, 5 Feb 2020 17:30:42 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Message-ID: <20200205173042.chqij5i53mncfzar@holly.lan>
References: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204141219.1.Ief3f3a7edbbd76165901b14813e90381c290786d@changeid>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.67 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.67 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1izOvl-00BBbG-F9
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Fix compiling on architectures
 w/out DBG_MAX_REG_NUM defined
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
Cc: Anatoly Pugachev <matorola@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 kgdb-bugreport@lists.sourceforge.net, sparclinux@vger.kernel.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Feb 04, 2020 at 02:12:25PM -0800, Douglas Anderson wrote:
> In commit bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd"
> if current task has no regs") I tried to clean things up by using "if"
> instead of "#ifdef".  Turns out we really need "#ifdef" since not all
> architectures define some of the structures that the code is referring
> to.
> 
> Let's switch to #ifdef again, but at least avoid using it inside of
> the function.
> 
> Fixes: bbfceba15f8d ("kdb: Get rid of confusing diag msg from "rd" if current task has no regs")
> Reported-by: Anatoly Pugachev <matorola@gmail.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Thanks for being so quick with this (especially when if I had been less
delinquent with linux-next it might have been spotted sooner).


> ---
> I don't have a sparc64 compiler but I'm pretty sure this should work.
> Testing appreciated.

I've just add sparc64 into my pre-release testing (although I have had to
turn off a bunch of additional compiler warnings in order to do so).


>  kernel/debug/kdb/kdb_main.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index b22292b649c4..c84e61747267 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -1833,6 +1833,16 @@ static int kdb_go(int argc, const char **argv)
>  /*
>   * kdb_rd - This function implements the 'rd' command.
>   */
> +
> +/* Fallback to Linux showregs() if we don't have DBG_MAX_REG_NUM */
> +#if DBG_MAX_REG_NUM <= 0
> +static int kdb_rd(int argc, const char **argv)
> +{
> +	if (!kdb_check_regs())
> +		kdb_dumpregs(kdb_current_regs);
> +	return 0;
> +}
> +#else

The original kdb_rd (and kdb_rm which still exists in this file) place
the #if inside the function and users > 0 so the common case was
covered at the top and the fallback at the bottom.

Why change style when re-introducing this code?


Daniel.


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
