Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F8B26EE4
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Aug 2025 20:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0wqlfNA0i7mYBpZSksXrnfGBIx0InDMAjxHSJuWUFU=; b=D5K3eQILHorZQsZUQW0solVY/e
	gNvJrp8ewpCwNizoYgVX/5SsGmkZNP3+KJQm4X5SwLI6BC3al9bCV5BcMvNA93E30gppIj9q+IU5C
	azDZzLSX+uA+oZKzVmmU2VgAyItrpM3lzMDVpVNSrdzNKkdOq4eidGffOYG/PT+gHpsw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1umchh-0002f2-3l
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 14 Aug 2025 18:29:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1umchZ-0002eH-Ro
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Aug 2025 18:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GU1C98lrH0BOCoTl73QN++nBC+OaC9aw6W8ZJ2bNgX0=; b=GuRh/ViuyC4Tc/BGksDyes0oNM
 o5ZdV+W6N+VY5LoXTFEM+j4ZDEpBVphKxvQquVlPrgnamFI00uCeylt309/bzD0APf2T8sLwBB1zR
 6BchkdMkfu008JTrHpjh5qcJWrBbRDfbVNxyuBV3tpuI4ObC47ygZmcHSSgzegUk4AkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GU1C98lrH0BOCoTl73QN++nBC+OaC9aw6W8ZJ2bNgX0=; b=TX9k4p3EZTRzW/dJg6konfzLn+
 QViX15CKyInBm/p9deOK6Cphnraa2FMSJQV00zMs6u/Pawo/6OlRnCZdxiVusO1NN846MOpKvtbEb
 Qh5JE8ydjsGUdjXCcuNA5hg4QFAw3V4LfmMMP2xVDYc26WZ2RtX2P1xnt2Ir0FZSKuiA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umcha-0003JQ-1I for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Aug 2025 18:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EFF31601E0;
 Thu, 14 Aug 2025 18:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C90C4CEED;
 Thu, 14 Aug 2025 18:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1755196154;
 bh=H/7cxgG58tWqR4Nrwl+Uq7YGXzUlJdaBMhPlhJ1BJD8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yoHaKrbc7hk54aha/UoZ8wC+34GeR+MY6b7PkJY+7npyEhDHs7vrOhq0Fb33dKBJX
 t4nDu3O/uSlOw+nDwE98UYI0FjCItPaUENBggTQXgd0uPLOYVQD4DUA1hFMrgk46SP
 HiDLZCYCz6VRu48OZI3g7L7jy45dWhtjnAFHbx+4=
Date: Thu, 14 Aug 2025 20:29:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <2025081451-amigo-joylessly-8b8d@gregkh>
References: <20250814163237.229544-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250814163237.229544-2-thorsten.blum@linux.dev>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 06:32:34PM +0200,
 Thorsten Blum wrote:
 > strcpy() is deprecated; use strscpy() and memcpy() instead and remove >
 several manual NUL-terminations. > > In parse_grep(), we can sa [...] 
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
X-Headers-End: 1umcha-0003JQ-1I
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Replace deprecated strcpy()
 with strscpy() and memcpy()
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

On Thu, Aug 14, 2025 at 06:32:34PM +0200, Thorsten Blum wrote:
> strcpy() is deprecated; use strscpy() and memcpy() instead and remove
> several manual NUL-terminations.
> 
> In parse_grep(), we can safely use memcpy() because we already know the
> length of the source string 'cp' and that it is guaranteed to be
> NUL-terminated within the first KDB_GREP_STRLEN bytes.
> 
> Since the destination buffers 'cmd_cur' and 'cmd_hist[cmd_head]' have
> the fixed length CMD_BUFLEN, strscpy() automatically determines their
> size using sizeof() when the size argument is omitted. This makes the
> explicit size arguments for the existing strscpy() calls unnecessary,
> remove them.
> 
> No functional changes intended.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Use memcpy() instead of strscpy() in parse_grep() as suggested by Greg
> - Compile-tested only so far
> - Link to v1: https://lore.kernel.org/lkml/20250814120338.219585-2-thorsten.blum@linux.dev/
> ---
>  kernel/debug/kdb/kdb_main.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 7a4d2d4689a5..048dbbcd91a4 100644
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
> +	memcpy(kdb_grep_string, cp, len + 1);
>  	kdb_grepping_flag++;
>  	return;
>  }
> @@ -1076,12 +1072,12 @@ static int handle_ctrl_cmd(char *cmd)
>  		if (cmdptr != cmd_tail)
>  			cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
>  				 KDB_CMD_HISTORY_COUNT;
> -		strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
> +		strscpy(cmd_cur, cmd_hist[cmdptr]);

Again, you are doing two different things in this patch, it should be 2
different patches.

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
