Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B4635F36B
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 14 Apr 2021 14:22:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1lWeXJ-0002H9-4Q
	for lists+kgdb-bugreport@lfdr.de; Wed, 14 Apr 2021 12:22:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <daniel.thompson@linaro.org>) id 1lWeWR-0002BH-O0
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Apr 2021 12:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJuxk4zPlQH5IUXSuwuzi9hj14c/oTVVhjOacjlJBoQ=; b=OTKZiAJEnBAc0oyzKgkmkHn3Ws
 K59p2fB5OiKLjP0+cTxoY9VXrIdj5tgf13i/4bmwmC8RJ8sgx1uSRAVbv5QHJ7w7LTCI+7dzzxQlG
 gAkHmAlq58aAxKZX1Di7cnSkNbAPwSctAvdB6CseHrIbGExaJ+d9IycU5KW36C5Vnyuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJuxk4zPlQH5IUXSuwuzi9hj14c/oTVVhjOacjlJBoQ=; b=CdCrbTkdXLN4YCF1ogwmZDmA4y
 C77vHZDKKLDorA0zD4Z6VHaXQaoTvgzyCjvnsZWQ588Arg62byM1aLVC+Fk8eRwBunrGkaNSdJj/0
 hTtHeKwJz4spWpGQ2ACRA60LO3MnBopbWgL2+7f2IA9Tv66libjHilcreYPvlXpT0uC4=;
Received: from mail-ed1-f43.google.com ([209.85.208.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lWeOG-00026W-Eh
 for kgdb-bugreport@lists.sourceforge.net; Wed, 14 Apr 2021 12:13:16 +0000
Received: by mail-ed1-f43.google.com with SMTP id s15so23414780edd.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 14 Apr 2021 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IJuxk4zPlQH5IUXSuwuzi9hj14c/oTVVhjOacjlJBoQ=;
 b=mmWeD5SqKE9BjEt/P3QqETaJ+3QJwkW7dXM0WnvBGQ50nVBdoi+D77S2+lX0RdAjcJ
 0Bc+rsRr6ryqQVzw8IGn4addQqkZgot7GzJXagr4UgeMcoKwlIiuiufFqaUVoX5fL0+N
 NLn9f4FfUB6B0Wh/vQpY6B7eSr3+IOdeGr9s0R9BYOmP7f5hmCz1sLmdnjEYos4hIzZM
 b20yvI/m/9t5BrzYfa4Wg1+7/WHra4L2dVCBP79g0ZukNCKFatInODczPb1OAkcFbPuP
 dhJZyinSoxya6993w2yV9tRKOt8KB+13+e3XkxZVwUp90B5nVgJdcBURqhBlg9oGx3iU
 3Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IJuxk4zPlQH5IUXSuwuzi9hj14c/oTVVhjOacjlJBoQ=;
 b=JL/S0Mp9ZEBlNrvRH0BbG/vKuisqaqGcg0QbEdnUfzr9q0UBXLh9aPYzhLSqcVJ0jE
 x6cWOF9PaKVDoPYfmzEl/GYBUQljuBdxpKR6AB6ymQAGEW0ToMZV2dmejgWRI0cJX4rX
 Yh1c9cK/uXSZI1T/NJLFsHeRAuD5Re0TRLeZj43rLpZ1rOlAnCQE92AbsuiFu7hdtTL1
 wOveZsYHkz139jNkeZtPRgdnePKq+8l35GcxrT8uAnXukrunT9bhdMIwmXuC1vfExbkj
 5XPNHm07Oqr6iTgMH28f5gnIKZsysfXcXg7aPXLlnnUQ3Rr/siaQukvEbzyBGhUup4Km
 U1xg==
X-Gm-Message-State: AOAM532XwRYRLD6saIFNFItmi+AyisKjWNgjIiWV7kiX+6/VN1ns3P5x
 WO1QuYins6CHgbitpJgMw0UUZeyMsTdXX223
X-Google-Smtp-Source: ABdhPJxg9No61flv4YlQa5lgpB9UWlrRh9wXUnVmtJv8hlGWAZxa9KpjvwaYoY/3bkG77C0BntknnQ==
X-Received: by 2002:a17:906:1706:: with SMTP id
 c6mr37533537eje.223.1618395302260; 
 Wed, 14 Apr 2021 03:15:02 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id mp36sm9288213ejc.48.2021.04.14.03.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 03:15:01 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:14:59 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sumit Garg <sumit.garg@linaro.org>
Message-ID: <20210414101459.yu4mfcikkzelwz5t@maple.lan>
References: <20210413114457.1525224-1-sumit.garg@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413114457.1525224-1-sumit.garg@linaro.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.43 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lWeOG-00026W-Eh
Subject: Re: [Kgdb-bugreport] [PATCH v2] kdb: Simplify kdb_defcmd macro logic
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
Cc: kgdb-bugreport@lists.sourceforge.net, jason.wessel@windriver.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Tue, Apr 13, 2021 at 05:14:57PM +0530, Sumit Garg wrote:
> Switch to use a linked list instead of dynamic array which makes
> allocation of kdb macro and traversing the kdb macro commands list
> simpler.
> 
> Also, rename defcmd_set struct to kdb_macro_t struct as it sounds more
> appropriate given its purpose. Along with this directly embed kdbtab_t
> struct instead of custom command fields in kdb_macro_t struct as its now
> possible to register pre-allocated kdb commands via kdb_register_table().

There is a bit too much going on in this patch and that makes it
really hard to review. More specifically it looks like it contains two
unrelated changes.

The first change embeddeds a kdbtab_t structure in defcmd_set and
renames it for clarity. This removes the last non-trivial user of
kdb_register_flags() and would ideally be included as part of a patch
series that removes kdb_register_flags() from the code base entirely.
For example currently there is one user of kdb_register() and this
should be handled by changing the prototype of kdb_register() to take a
single kdbtab_t* instead (e.g. an inline for kdb_register_table(..., 1).
That then leaves two users of kdb_register_flags() which can both be
switched over the new definition of kdb_register().

The second change modifies the internals how macro definitions work.
I suspect it a good change but it is not easily reviewable when it is
tangled up with the (partial) removal of kdb_register_flags().


Daniel.


> 
> Suggested-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
> 
> Changes in v2:
> - Define new structs: kdb_macro_t and kdb_macro_cmd_t instead of
>   modifying existing kdb command struct and struct kdb_subcmd.
> - Reword commit message.
> 
>  kernel/debug/kdb/kdb_main.c | 158 +++++++++++++++++++-----------------
>  1 file changed, 83 insertions(+), 75 deletions(-)
> 
> diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
> index 9d69169582c6..2f2c0e3b39a9 100644
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -678,16 +678,17 @@ static void kdb_cmderror(int diag)
>   * Returns:
>   *	zero for success, a kdb diagnostic if error
>   */
> -struct defcmd_set {
> -	int count;
> -	bool usable;
> -	char *name;
> -	char *usage;
> -	char *help;
> -	char **command;
> +struct kdb_macro_t {
> +	kdbtab_t cmd;			/* Macro command name */
> +	struct list_head commands;	/* Associated command list */
>  };
> -static struct defcmd_set *defcmd_set;
> -static int defcmd_set_count;
> +
> +struct kdb_macro_cmd_t {
> +	char *cmd;			/* Command name */
> +	struct list_head list_node;	/* Command list node */
> +};
> +
> +static struct kdb_macro_t *kdb_macro;
>  static bool defcmd_in_progress;
>  
>  /* Forward references */
> @@ -695,53 +696,56 @@ static int kdb_exec_defcmd(int argc, const char **argv);
>  
>  static int kdb_defcmd2(const char *cmdstr, const char *argv0)
>  {
> -	struct defcmd_set *s = defcmd_set + defcmd_set_count - 1;
> -	char **save_command = s->command;
> +	struct kdb_macro_cmd_t *kmc;
> +
> +	if (!kdb_macro)
> +		return KDB_NOTIMP;
> +
>  	if (strcmp(argv0, "endefcmd") == 0) {
>  		defcmd_in_progress = false;
> -		if (!s->count)
> -			s->usable = false;
> -		if (s->usable)
> -			/* macros are always safe because when executed each
> -			 * internal command re-enters kdb_parse() and is
> -			 * safety checked individually.
> -			 */
> -			kdb_register_flags(s->name, kdb_exec_defcmd, s->usage,
> -					   s->help, 0,
> -					   KDB_ENABLE_ALWAYS_SAFE);
> +		if (!list_empty(&kdb_macro->commands))
> +			kdb_register_table(&kdb_macro->cmd, 1);
>  		return 0;
>  	}
> -	if (!s->usable)
> -		return KDB_NOTIMP;
> -	s->command = kcalloc(s->count + 1, sizeof(*(s->command)), GFP_KDB);
> -	if (!s->command) {
> -		kdb_printf("Could not allocate new kdb_defcmd table for %s\n",
> +
> +	kmc = kmalloc(sizeof(*kmc), GFP_KDB);
> +	if (!kmc) {
> +		kdb_printf("Could not allocate new kdb macro command: %s\n",
>  			   cmdstr);
> -		s->usable = false;
>  		return KDB_NOTIMP;
>  	}
> -	memcpy(s->command, save_command, s->count * sizeof(*(s->command)));
> -	s->command[s->count++] = kdb_strdup(cmdstr, GFP_KDB);
> -	kfree(save_command);
> +
> +	kmc->cmd = kdb_strdup(cmdstr, GFP_KDB);
> +	list_add_tail(&kmc->list_node, &kdb_macro->commands);
> +
>  	return 0;
>  }
>  
>  static int kdb_defcmd(int argc, const char **argv)
>  {
> -	struct defcmd_set *save_defcmd_set = defcmd_set, *s;
> +	kdbtab_t *mp;
> +
>  	if (defcmd_in_progress) {
>  		kdb_printf("kdb: nested defcmd detected, assuming missing "
>  			   "endefcmd\n");
>  		kdb_defcmd2("endefcmd", "endefcmd");
>  	}
>  	if (argc == 0) {
> -		int i;
> -		for (s = defcmd_set; s < defcmd_set + defcmd_set_count; ++s) {
> -			kdb_printf("defcmd %s \"%s\" \"%s\"\n", s->name,
> -				   s->usage, s->help);
> -			for (i = 0; i < s->count; ++i)
> -				kdb_printf("%s", s->command[i]);
> -			kdb_printf("endefcmd\n");
> +		kdbtab_t *kp;
> +		struct kdb_macro_t *kmp;
> +		struct kdb_macro_cmd_t *kmc;
> +
> +		list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> +			if (kp->cmd_func == kdb_exec_defcmd) {
> +				kdb_printf("defcmd %s \"%s\" \"%s\"\n",
> +					   kp->cmd_name, kp->cmd_usage,
> +					   kp->cmd_help);
> +				kmp = container_of(kp, struct kdb_macro_t, cmd);
> +				list_for_each_entry(kmc, &kmp->commands,
> +						    list_node)
> +					kdb_printf("%s", kmc->cmd);
> +				kdb_printf("endefcmd\n");
> +			}
>  		}
>  		return 0;
>  	}
> @@ -751,45 +755,43 @@ static int kdb_defcmd(int argc, const char **argv)
>  		kdb_printf("Command only available during kdb_init()\n");
>  		return KDB_NOTIMP;
>  	}
> -	defcmd_set = kmalloc_array(defcmd_set_count + 1, sizeof(*defcmd_set),
> -				   GFP_KDB);
> -	if (!defcmd_set)
> +	kdb_macro = kzalloc(sizeof(*kdb_macro), GFP_KDB);
> +	if (!kdb_macro)
>  		goto fail_defcmd;
> -	memcpy(defcmd_set, save_defcmd_set,
> -	       defcmd_set_count * sizeof(*defcmd_set));
> -	s = defcmd_set + defcmd_set_count;
> -	memset(s, 0, sizeof(*s));
> -	s->usable = true;
> -	s->name = kdb_strdup(argv[1], GFP_KDB);
> -	if (!s->name)
> +	mp = &kdb_macro->cmd;
> +
> +	mp->cmd_func = kdb_exec_defcmd;
> +	mp->cmd_minlen = 0;
> +	mp->cmd_flags = KDB_ENABLE_ALWAYS_SAFE;
> +	mp->cmd_name = kdb_strdup(argv[1], GFP_KDB);
> +	if (!mp->cmd_name)
>  		goto fail_name;
> -	s->usage = kdb_strdup(argv[2], GFP_KDB);
> -	if (!s->usage)
> +	mp->cmd_usage = kdb_strdup(argv[2], GFP_KDB);
> +	if (!mp->cmd_usage)
>  		goto fail_usage;
> -	s->help = kdb_strdup(argv[3], GFP_KDB);
> -	if (!s->help)
> +	mp->cmd_help = kdb_strdup(argv[3], GFP_KDB);
> +	if (!mp->cmd_help)
>  		goto fail_help;
> -	if (s->usage[0] == '"') {
> -		strcpy(s->usage, argv[2]+1);
> -		s->usage[strlen(s->usage)-1] = '\0';
> +	if (mp->cmd_usage[0] == '"') {
> +		strcpy(mp->cmd_usage, argv[2]+1);
> +		mp->cmd_usage[strlen(mp->cmd_usage)-1] = '\0';
>  	}
> -	if (s->help[0] == '"') {
> -		strcpy(s->help, argv[3]+1);
> -		s->help[strlen(s->help)-1] = '\0';
> +	if (mp->cmd_help[0] == '"') {
> +		strcpy(mp->cmd_help, argv[3]+1);
> +		mp->cmd_help[strlen(mp->cmd_help)-1] = '\0';
>  	}
> -	++defcmd_set_count;
> +
> +	INIT_LIST_HEAD(&kdb_macro->commands);
>  	defcmd_in_progress = true;
> -	kfree(save_defcmd_set);
>  	return 0;
>  fail_help:
> -	kfree(s->usage);
> +	kfree(mp->cmd_usage);
>  fail_usage:
> -	kfree(s->name);
> +	kfree(mp->cmd_name);
>  fail_name:
> -	kfree(defcmd_set);
> +	kfree(kdb_macro);
>  fail_defcmd:
> -	kdb_printf("Could not allocate new defcmd_set entry for %s\n", argv[1]);
> -	defcmd_set = save_defcmd_set;
> +	kdb_printf("Could not allocate new kdb_macro entry for %s\n", argv[1]);
>  	return KDB_NOTIMP;
>  }
>  
> @@ -804,25 +806,31 @@ static int kdb_defcmd(int argc, const char **argv)
>   */
>  static int kdb_exec_defcmd(int argc, const char **argv)
>  {
> -	int i, ret;
> -	struct defcmd_set *s;
> +	int ret;
> +	kdbtab_t *kp;
> +	struct kdb_macro_t *kmp;
> +	struct kdb_macro_cmd_t *kmc;
> +
>  	if (argc != 0)
>  		return KDB_ARGCOUNT;
> -	for (s = defcmd_set, i = 0; i < defcmd_set_count; ++i, ++s) {
> -		if (strcmp(s->name, argv[0]) == 0)
> +
> +	list_for_each_entry(kp, &kdb_cmds_head, list_node) {
> +		if (strcmp(kp->cmd_name, argv[0]) == 0)
>  			break;
>  	}
> -	if (i == defcmd_set_count) {
> +	if (list_entry_is_head(kp, &kdb_cmds_head, list_node)) {
>  		kdb_printf("kdb_exec_defcmd: could not find commands for %s\n",
>  			   argv[0]);
>  		return KDB_NOTIMP;
>  	}
> -	for (i = 0; i < s->count; ++i) {
> -		/* Recursive use of kdb_parse, do not use argv after
> -		 * this point */
> +	kmp = container_of(kp, struct kdb_macro_t, cmd);
> +	list_for_each_entry(kmc, &kmp->commands, list_node) {
> +		/*
> +		 * Recursive use of kdb_parse, do not use argv after this point.
> +		 */
>  		argv = NULL;
> -		kdb_printf("[%s]kdb> %s\n", s->name, s->command[i]);
> -		ret = kdb_parse(s->command[i]);
> +		kdb_printf("[%s]kdb> %s\n", kmp->cmd.cmd_name, kmc->cmd);
> +		ret = kdb_parse(kmc->cmd);
>  		if (ret)
>  			return ret;
>  	}
> -- 
> 2.25.1


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
