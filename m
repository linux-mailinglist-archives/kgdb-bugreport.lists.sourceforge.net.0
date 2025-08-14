Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 956ABB265EE
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Aug 2025 14:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WWQCK+cIzzhi+TxZ2Qyh6nAUma/Dr9CIsbDrOszVaE=; b=LT//DsTOcXL8sgZDcMOrKOwKvb
	3/3EqxhPZiZrunRbiHmETDJSq4LtFh2EObb1Sb/Q+8Z3BduiyIRmn3HD8ARiFlClz4TtJZ0bwMZRG
	MCniHoDKbpoJXtC2XydWwymjWxo8DMf85ZeVX2dJmxMWQ+GrrdBzIh8FIOORFsfCx6pY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1umXSz-0000v7-NR
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 14 Aug 2025 12:54:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1umXSs-0000ui-I7
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Aug 2025 12:53:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7l1fzZfikpcvF5+QLJLnHMvdU4KnIRsEHkSWezi1zE0=; b=m8Bs1l/YFEyNO4Z34N1eyIuprM
 JDJ1F6lpMIMF0kDVqm4wcAj4iBAPkcLt93unYHh+pF3g8ZujSIQmjMFqk4jy8XUiO2aoKVp4qJ8a5
 nRAeeBz2e+QZ3YCx/ScPeAEbkideOtPvo5rJHUyoUqjw9n09SJxUqXl1gMbZsAmRBho0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7l1fzZfikpcvF5+QLJLnHMvdU4KnIRsEHkSWezi1zE0=; b=as7t3SLEVI2B0eqm/Phh4qg06K
 CKUZM2mCUlP4YY9Fr1Ip3+0bn2r10VwJATO8VL3p2vzLU0JaVXXHNr8Oo8MIJIvykASPGiTm39l3+
 gzUXIBPeKeRnGB3/5gUM676NCA7OTtRodR3z+9ARjCfr4Qrxh/uITlj+8oN0OgA+Ujmk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umXSo-0001iG-IM for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Aug 2025 12:53:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB49043E41;
 Thu, 14 Aug 2025 12:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DD7C4CEED;
 Thu, 14 Aug 2025 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1755174959;
 bh=d0chepvMTCh7nRNY6/nneXMPwXlxAZHGQVMwQe1JW7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oqG6vsmT6xx5AVJ16aY0bqHueR5rs6uSzjLDF2Z0RynkKkuXd8pWKSp5ET/C63K1X
 q88qpINM5+WUMfQ5OklViyEWoIyjedXdRJxgrz3OPdF8oQ01icqqAVOwBrGZgwlxQw
 kep8Lbasji0XU9XbRcWV9A1DUATcw8iM9VFUXupQ=
Date: Thu, 14 Aug 2025 14:35:56 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <2025081408-swinging-endorphin-abe2@gregkh>
References: <20250814120338.219585-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814120338.219585-2-thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 02:03:37PM +0200,
 Thorsten Blum wrote:
 > strcpy() is deprecated; use strscpy() instead and remove several manual
 > NUL-terminations. Manual NULL terminations are good, why get rid of that?
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umXSo-0001iG-IM
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Replace deprecated strcpy() with
 strscpy()
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
Cc: Nir Lichtman <nir@lichtman.org>, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, Daniel Thompson <danielt@kernel.org>,
 linux-hardening@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Aug 14, 2025 at 02:03:37PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() instead and remove several manual
> NUL-terminations.

Manual NULL terminations are good, why get rid of that?

> Since the destination buffers 'cmd_cur' and 'cmd_hist[cmd_head]' have
> the fixed length CMD_BUFLEN, strscpy() automatically determines their
> size using sizeof() when the size argument is omitted. This makes the
> explicit size arguments for the existing strscpy() calls unnecessary,
> remove them.

But now you are dynamically calculating this?

> No functional changes intended.

How did you test this?  Many of these types of changes are wrong, so you
really really need to prove it is correct.

> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  kernel/debug/kdb/kdb_main.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 7a4d2d4689a5..ea7dc2540e40 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -727,14 +727,10 @@ static int kdb_defcmd(int argc, const char **argv)
>  	mp->help = kdb_strdup(argv[3], GFP_KDB);
>  	if (!mp->help)
>  		goto fail_help;
> -	if (mp->usage[0] == '"') {
> -		strcpy(mp->usage, argv[2]+1);
> -		mp->usage[strlen(mp->usage)-1] = '\0';
> -	}
> -	if (mp->help[0] == '"') {
> -		strcpy(mp->help, argv[3]+1);
> -		mp->help[strlen(mp->help)-1] = '\0';
> -	}
> +	if (mp->usage[0] == '"')
> +		strscpy(mp->usage, argv[2] + 1, strlen(argv[2]) - 1);

Now you are manually testing the length of argv[2], are you sure that's
ok?

> +	if (mp->help[0] == '"')
> +		strscpy(mp->help, argv[3] + 1, strlen(argv[3]) - 1);
>  
>  	INIT_LIST_HEAD(&kdb_macro->statements);
>  	defcmd_in_progress = true;
> @@ -860,7 +856,7 @@ static void parse_grep(const char *str)
>  		kdb_printf("search string too long\n");
>  		return;
>  	}
> -	strcpy(kdb_grep_string, cp);
> +	strscpy(kdb_grep_string, cp);

If this was just a search/replace, it would have been done already, so
why is this ok?


>  	kdb_grepping_flag++;
>  	return;
>  }
> @@ -1076,12 +1072,12 @@ static int handle_ctrl_cmd(char *cmd)
>  		if (cmdptr != cmd_tail)
>  			cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
>  				 KDB_CMD_HISTORY_COUNT;
> -		strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
> +		strscpy(cmd_cur, cmd_hist[cmdptr]);

Same here.  And other places...

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
