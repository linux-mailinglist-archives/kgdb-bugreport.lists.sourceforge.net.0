Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F580B26984
	for <lists+kgdb-bugreport@lfdr.de>; Thu, 14 Aug 2025 16:36:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fm7rC21zGpaNsHlv2Vm6MhbGsnzNePfUsLkYtK9p4Wo=; b=YJ56gHn0RKNcEwFyMn7JwfJVAr
	AIh8ORekp4klwm8kakUtWoUSyb1hD1Hw3/Eim7nhkudyBQqppoSybin55fVCHLP65qbBNxnBO1lB2
	iyBOXnXIQcGAS7VOIEfvpIzyIIK+Gz99C3az+CkUtZ0MPASnfxsmgT2VU+btmpbxqSGU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1umZ3f-0001Rs-6D
	for lists+kgdb-bugreport@lfdr.de;
	Thu, 14 Aug 2025 14:35:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1umZ3d-0001Rm-VS
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Aug 2025 14:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dkqX7AqZ03Qc4v1lV+jMtIpkd83TYWYnC4WrmU7UOeE=; b=iRajfpMl8DM9vnj1gr8SGX+oWk
 Q8CMe+j/I6rkQ/ePxZ5hxPQPQSv3AbouU8dX5u6xT7XRBXh7FCpvy97EVvoyx9YYZ2Swk3C+N6i14
 o4rMNZgx055rz5eK6nO0NQjoJ918AZ/cjlgrQFAHzaNiREaKTrApsWrSkSc2U0FinA+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dkqX7AqZ03Qc4v1lV+jMtIpkd83TYWYnC4WrmU7UOeE=; b=SI71HoSXyQfdT4XOZa+9ukmytV
 Jj5SSHKZIOKT+HyCrWcEV9xUOeLTtypGDy9WFnMZqW0K2s5l4D2mCIrr+rVXYRcDxAJUtmChsMBOZ
 +UQCVWiiocfeY/nF7oalzJlGzJ1wqDoZdn2HgJfxEv7uPO0rnpAYttStUOAdBVU2elNI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umZ3d-000896-8u for kgdb-bugreport@lists.sourceforge.net;
 Thu, 14 Aug 2025 14:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCB415C7111;
 Thu, 14 Aug 2025 14:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1BE8C4CEED;
 Thu, 14 Aug 2025 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1755182151;
 bh=5r1ZfIYGt/SxED81e4SqxHAoPVYmkOk9pNZTa4DTRio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VpKlledij6N1ObIMYIvXSGcwhoDFYArU1cCfJrKecfygL3SEf2/Zk9IFYFibNf8cy
 ZWlpDduYUsGUuhMoOFrTfYB75f8B/qfBVKR7ExKtHROyl5P6ZBl0ztw16nN/bNC5CJ
 rvmL8iV/zRE8CoUWj846Td8k+RBX4GHwU1LfCOos=
Date: Thu, 14 Aug 2025 16:35:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Message-ID: <2025081456-reflected-revolver-9f5b@gregkh>
References: <20250814120338.219585-2-thorsten.blum@linux.dev>
 <2025081408-swinging-endorphin-abe2@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2025081408-swinging-endorphin-abe2@gregkh>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Aug 14, 2025 at 02:35:56PM +0200, Greg Kroah-Hartman
 wrote: > On Thu, Aug 14, 2025 at 02:03:37PM +0200, Thorsten Blum wrote: >
 > strcpy() is deprecated; use strscpy() instead and remove severa [...] 
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
X-Headers-End: 1umZ3d-000896-8u
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

On Thu, Aug 14, 2025 at 02:35:56PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 14, 2025 at 02:03:37PM +0200, Thorsten Blum wrote:
> > strcpy() is deprecated; use strscpy() instead and remove several manual
> > NUL-terminations.
> 
> Manual NULL terminations are good, why get rid of that?
> 
> > Since the destination buffers 'cmd_cur' and 'cmd_hist[cmd_head]' have
> > the fixed length CMD_BUFLEN, strscpy() automatically determines their
> > size using sizeof() when the size argument is omitted. This makes the
> > explicit size arguments for the existing strscpy() calls unnecessary,
> > remove them.
> 
> But now you are dynamically calculating this?
> 
> > No functional changes intended.
> 
> How did you test this?  Many of these types of changes are wrong, so you
> really really need to prove it is correct.
> 
> > 
> > Link: https://github.com/KSPP/linux/issues/88
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  kernel/debug/kdb/kdb_main.c | 32 ++++++++++++++------------------
> >  1 file changed, 14 insertions(+), 18 deletions(-)
> > 
> > diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> > index 7a4d2d4689a5..ea7dc2540e40 100644
> > --- a/kernel/debug/kdb/kdb_main.c
> > +++ b/kernel/debug/kdb/kdb_main.c
> > @@ -727,14 +727,10 @@ static int kdb_defcmd(int argc, const char **argv)
> >  	mp->help = kdb_strdup(argv[3], GFP_KDB);
> >  	if (!mp->help)
> >  		goto fail_help;
> > -	if (mp->usage[0] == '"') {
> > -		strcpy(mp->usage, argv[2]+1);
> > -		mp->usage[strlen(mp->usage)-1] = '\0';
> > -	}
> > -	if (mp->help[0] == '"') {
> > -		strcpy(mp->help, argv[3]+1);
> > -		mp->help[strlen(mp->help)-1] = '\0';
> > -	}
> > +	if (mp->usage[0] == '"')
> > +		strscpy(mp->usage, argv[2] + 1, strlen(argv[2]) - 1);
> 
> Now you are manually testing the length of argv[2], are you sure that's
> ok?
> 
> > +	if (mp->help[0] == '"')
> > +		strscpy(mp->help, argv[3] + 1, strlen(argv[3]) - 1);
> >  
> >  	INIT_LIST_HEAD(&kdb_macro->statements);
> >  	defcmd_in_progress = true;
> > @@ -860,7 +856,7 @@ static void parse_grep(const char *str)
> >  		kdb_printf("search string too long\n");
> >  		return;
> >  	}
> > -	strcpy(kdb_grep_string, cp);
> > +	strscpy(kdb_grep_string, cp);
> 
> If this was just a search/replace, it would have been done already, so
> why is this ok?

I missed that strscpy() can now handle 2 arguments like this, so yes,
this should be ok.

BUT, you just checked the length above this line, which now isn't
needed, right?  So this function can get simpler?


> 
> 
> >  	kdb_grepping_flag++;
> >  	return;
> >  }
> > @@ -1076,12 +1072,12 @@ static int handle_ctrl_cmd(char *cmd)
> >  		if (cmdptr != cmd_tail)
> >  			cmdptr = (cmdptr + KDB_CMD_HISTORY_COUNT - 1) %
> >  				 KDB_CMD_HISTORY_COUNT;
> > -		strscpy(cmd_cur, cmd_hist[cmdptr], CMD_BUFLEN);
> > +		strscpy(cmd_cur, cmd_hist[cmdptr]);
> 
> Same here.  And other places...

Sorry, this should also be ok, BUT it's really just doing the same exact
thing, right?  And, it's a different thing, so it should be a different
patch (i.e. do not mix different logical things in the same patch, it
confuses everyone.  Well, me at least...)

thanks,

greg k-h


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
